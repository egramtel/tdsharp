module TdLib.CodeGen.Generator

open System
open FParsec

let rec getDotNetType (t: Parser.TlType) =
    match t with
    | Parser.TlDouble -> "double?"
    | Parser.TlString -> "string"
    | Parser.TlInt32 -> "int"
    | Parser.TlInt53 -> "long"
    | Parser.TlInt64 -> "long"
    | Parser.TlBytes -> "byte[]"
    | Parser.TlBool -> "bool"
    | Parser.TlCustom c -> Utils.toCamelCase c Utils.UpperCase
    | Parser.TlVector t -> (getDotNetType t) + "[]"

let getTypeAnnotationText (annotations: Parser.TlAnnotation list) =
    annotations |> List.choose (fun a ->
        match a with
        | Parser.TlTypeAnnotation (text) -> Some(text)
        | _ -> None) |> List.tryHead

let getNamedAnnotationText (annotations: Parser.TlAnnotation list) fieldName =
    annotations |> List.choose (fun a ->
        match a with
        | Parser.TlFieldAnnotation (name, text) ->
            if name = fieldName then
                Some(text)
            else
                None
        | _ -> None) |> List.tryHead

let generateField (def: Parser.TlDef) (field: Parser.TlField) (annotations: Parser.TlAnnotation list) (tabulation: string) =
    let tlFieldName = field.FieldName

    let jsonConverterAttribute converterName = $"[JsonConverter(typeof({converterName}))]"
    let jsonPropertyAttribute additionalParams = $"[JsonProperty(\"{tlFieldName}\"{additionalParams})]"

    let converter =
        match field.TypeName with
        | Parser.TlInt64 -> "Converter.Int64"
        | _ -> "Converter"

    let fieldAttributes =
        match field.TypeName with
        | Parser.TlVector _ -> jsonPropertyAttribute $", ItemConverterType = typeof({converter})"
        | _ -> $"{jsonConverterAttribute converter}\n{tabulation}{jsonPropertyAttribute String.Empty}"

    let fieldType = getDotNetType field.TypeName
    let enclosingType =
        match def with
        | Parser.TlTypeDef (typeDef, _, _) -> getDotNetType typeDef
        | Parser.TlFuncDef (funcDef, _, _) -> getDotNetType funcDef
    let fieldName = Utils.toCamelCase field.FieldName Utils.UpperCase
    let fieldName =
        if fieldName = enclosingType then
            fieldName + "_"
        else
            fieldName
    let description =
        match getNamedAnnotationText annotations tlFieldName with
        | Some(text) -> text
        | None -> ""

    let lines = Utils.readResource "Field.tpl"
    lines |> Seq.map (fun line ->
        tabulation + line.Replace("$FIELD_DESCRIPTION", Utils.xmlEncode description)
            .Replace("$FIELD_ATTRIBUTES", fieldAttributes)
            .Replace("$FIELD_TYPE", fieldType)
            .Replace("$FIELD_NAME", fieldName))
        |> String.concat "\n"

let generateType (def: Parser.TlDef) (annotations: Parser.TlAnnotation list) =
    let (objectTypeName, fields, baseTypeName) =
        match def with
        | Parser.TlTypeDef (typeDef, fields, baseTypeDef) -> (getDotNetType typeDef, fields, getDotNetType baseTypeDef)
        | _ -> failwith "Generating types only supported for type definitions"

    let tlTypeName = Utils.toCamelCase objectTypeName Utils.LowerCase
    let isObjectType = objectTypeName = baseTypeName
    let tabulation = if isObjectType then "            " else "                " // the easiest way to do it, but not the prettiest

    let objectFields =
        fields
        |> List.map (fun field -> generateField def field annotations tabulation)
        |> String.concat "\n\n"

    let description =
        match getTypeAnnotationText annotations with
        | Some(text) -> text
        | None -> ""

    let lines = Utils.readResource (if isObjectType then "Object.tpl" else "Union.tpl")
    lines |> Seq.map (fun line ->
        line.Replace("$TYPE_DESCRIPTION", Utils.xmlEncode description)
            .Replace("$TYPE_NAME", objectTypeName)
            .Replace("$TL_TYPE_NAME", tlTypeName)
            .Replace("$BASE_TYPE_NAME", baseTypeName)
            .Replace("$TYPE_FIELDS", objectFields))
        |> String.concat "\n"

let generateFunc (def: Parser.TlDef) (annotations: Parser.TlAnnotation list) =
    let (funcTypeName, fields, returnTypeName) =
        match def with
        | Parser.TlFuncDef (funcDef, fields, returnDef) -> (getDotNetType funcDef, fields, getDotNetType returnDef)
        | _ -> failwith "Generating functions only supported for func definitions"
    let tlFuncTypeName = Utils.toCamelCase funcTypeName Utils.LowerCase
    let description =
        match getTypeAnnotationText annotations with
        | Some(text) -> text
        | None -> ""

    let funcFields =
        fields
        |> List.map (fun field -> generateField def field annotations "            ")
        |> String.concat "\n\n"

    let funcParams =
        fields
        |> List.map (fun field -> (getDotNetType field.TypeName,
                                   Utils.toCamelCase field.FieldName Utils.LowerCase))
        |> List.map (fun (t, n) -> sprintf "%s %s = default" t n)
        |> List.fold (fun acc a -> acc + ", " + a) ""

    let funcArgs =
        fields
        |> List.map (fun field -> (Utils.toCamelCase field.FieldName Utils.UpperCase,
                                   Utils.toCamelCase field.FieldName Utils.LowerCase))
        |> List.map (fun (f, a) -> sprintf "%s = %s" f a)
        |> fun arr -> String.Join(", ", arr)

    let lines = Utils.readResource "Function.tpl"
    lines |> Seq.map (fun line ->
        line.Replace("$FUNC_DESCRIPTION", Utils.xmlEncode description)
            .Replace("$FUNC_NAME", funcTypeName)
            .Replace("$TL_FUNC_NAME", tlFuncTypeName)
            .Replace("$RETURN_TYPE_NAME", returnTypeName)
            .Replace("$FUNC_FIELDS", funcFields)
            .Replace("$FUNC_PARAMS", funcParams)
            .Replace("$FUNC_ARGS", funcArgs))
        |> String.concat "\n"

let private isBasicDef(line: string) =
    // Skip the beginning of Types.tl
    line.StartsWith("double ? =")
    || line.StartsWith("string ? =")
    || line.StartsWith("int32 =")
    || line.StartsWith("int53 =")
    || line.StartsWith("int64 =")
    || line.StartsWith("bytes =")
    || line.StartsWith("boolFalse =")
    || line.StartsWith("boolTrue =")
    || line.StartsWith("vector {t:Type} # [ t ] =")

let generateAllTypes() = seq {
    let lines = Utils.readResource "Types.tl"

    let mutable annotations = []

    for line in lines do
        if String.IsNullOrWhiteSpace line || isBasicDef line then
            ()
        elif line.StartsWith("//") then
            match run Parser.parseAnnotationList line with
            | Success(result, _, _) -> annotations <- annotations @ result
            | _ -> ()
        else
            match run Parser.parseTypeDef line with
            | Success(def, _, _) ->
                match def with
                | Parser.TlTypeDef(definedType, _, _) ->
                    let typeName = getDotNetType definedType
                    let source = generateType def annotations
                    yield (typeName, source)
                | _ -> ()
            | Failure(err, _, _) -> failwith (sprintf "Could not parse \"%s\". Error: %s" line err)
            ()
            annotations <- []
}

let generateAllFuncs() = seq {
    let lines = Utils.readResource "Methods.tl"

    let mutable annotations = []

    for line in lines do
        if String.IsNullOrWhiteSpace(line) then
            ()
        elif line.StartsWith("//") then
            match run Parser.parseAnnotationList line with
            | Success(result, _, _) -> annotations <- annotations @ result
            | _ -> ()
        else
            match run Parser.parseFuncDef line with
            | Success(def, _, _) ->
                match def with
                | Parser.TlFuncDef(definedFunc, _, _) ->
                    let funcName = getDotNetType definedFunc
                    let source = generateFunc def annotations
                    yield (funcName, source)
                | _ -> ()
            | Failure(err, _, _) -> failwith (sprintf "Could not parse \"%s\". Error: %s" line err)
            ()
            annotations <- []
}
