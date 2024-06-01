// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

module TdLib.CodeGen.Parser

open FParsec
open Xunit

type TlType =
    | TlDouble
    | TlString
    | TlInt32
    | TlInt53
    | TlInt64
    | TlBytes
    | TlBool
    | TlCustom of string
    | TlVector of TlType

type TlField = {
    FieldName: string
    TypeName: TlType
}

type TlDef =
    | TlTypeDef of typeName: TlType * fields: TlField list * baseType: TlType
    | TlFuncDef of funcName: TlType * fields: TlField list * typeName: TlType

type TlAnnotation =
    | TlTypeAnnotation of text: string
    | TlFieldAnnotation of fieldName: string * text: string

type TlAnnotatedDef = {
    Definition: TlDef
    Annotations: TlAnnotation list
}

let getTypeFromString = function
    | "double" -> TlDouble
    | "string" -> TlString
    | "int32" -> TlInt32
    | "int53" -> TlInt53
    | "int64" -> TlInt64
    | "bytes" -> TlBytes
    | "Bool" -> TlBool
    | typeName -> TlCustom(typeName)

let parseIdentifier =
    let isIdentifierFirstChar c = isLetter c || c = '_'
    let isIdentifierChar c = isLetter c || isDigit c || c = '_'
    many1Satisfy2L isIdentifierFirstChar isIdentifierChar "Identifier"

let parseGeneric =
    ((pstring "vector<vector<") .>>. parseIdentifier .>>. (pstring ">>"))
    <|>
    ((pstring "vector<") .>>. parseIdentifier .>>. (pstring ">"))
    |>> fun ((s1, s2), s3) -> s1 + s2 + s3

let parseNestedVector =
    (pstring "vector<vector<") >>. parseIdentifier .>> (pstring ">>")
    |>> fun str -> TlVector(TlVector(getTypeFromString str))

let parseVector =
    (pstring "vector<") >>. parseIdentifier .>> (pstring ">")
    |>> fun str -> TlVector(getTypeFromString str)

let parseType =
    parseNestedVector
    <|>
    parseVector
    <|>
    (choice [
        pstring "double"
        pstring "string"
        pstring "int32"
        pstring "int53"
        pstring "int64"
        pstring "bytes"
        pstring "Bool"
        parseIdentifier ]
    |>> getTypeFromString)

let parseField =
    parseIdentifier .>>. (pstring ":" >>. parseType)
    |>> fun (fieldName, typeName) ->
        { FieldName = fieldName; TypeName = typeName }

let parseFieldList =
    many (parseField .>> spaces)

let parseDef =
    parseType .>>. (spaces1 >>. parseFieldList .>>. ((spaces >>. pstring "=" .>> spaces) >>. parseType))

let parseTypeDef =
    parseDef
    |>> fun (definedType, (fields, baseType)) ->
        TlTypeDef(definedType, fields, baseType)

let parseFuncDef =
    parseDef
    |>> fun (definedFunc, (fields, returnType)) ->
        TlFuncDef(definedFunc, fields, returnType)

let parseAnnotation =
    let isAllowed c = not (c = '@')
    (pstring "@" >>. parseIdentifier .>> spaces1) .>>. (manySatisfy isAllowed)
    |>> fun (id, text) ->
            if id = "description"
            then TlTypeAnnotation(text.Trim())
            else TlFieldAnnotation(id, text.Trim())

let parseAnnotationList =
    many parseAnnotation

[<Fact>]
let ``parseType parses simple types``() =
    match run parseType "string" with
    | Success(result, _, _) ->
        match result with
        | TlString -> ()
        | _ -> failwith "Wrong type, expected string"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseType parses vector types``() =
    match run parseType "vector<string>" with
    | Success(result, _, _) ->
        match result with
        | TlVector(ofType) ->
            Assert.Equal(TlString, ofType)
        | _ -> failwith "Wrong type, expected vector of string"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseType parses nested vector types``() =
    match run parseType "vector<vector<string>>" with
    | Success(result, _, _) ->
        match result with
        | TlVector(ofType) ->
            match ofType with
            | TlVector(nestedType) ->
                Assert.Equal(TlString, nestedType)
            | _ -> failwith "Wrong type, expected vector of vector of string"
        | _ -> failwith "Wrong type, expected vector of vector of string"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseType parses custom types``() =
    match run parseType "Custom" with
    | Success(result, _, _) ->
        match result with
        | TlCustom(typeName) -> Assert.Equal("Custom", typeName)
        | _ -> failwith "Wrong type, expected custom type"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseField parses name and type as field``() =
    match run parseField "field:int32" with
    | Success(result, _, _) ->
        Assert.Equal("field", result.FieldName)
        Assert.Equal(TlInt32, result.TypeName)
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseFieldList parses list of names with types``() =
    match run parseFieldList "one:int32 two:Bool three:bytes" with
    | Success(fieldList, _, _) ->
        match fieldList with
        | [one; two; three] ->
            Assert.Equal("one", one.FieldName)
            Assert.Equal(TlInt32, one.TypeName)
            Assert.Equal("two", two.FieldName)
            Assert.Equal(TlBool, two.TypeName)
            Assert.Equal("three", three.FieldName)
            Assert.Equal(TlBytes, three.TypeName)
        | _ -> failwith "Incorrect number of fields, expected 3"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseTypeDef parses type with fields and base type``() =
    match run parseTypeDef "custom one:double two:string = BaseType" with
    | Success(typeDef, _, _) ->
        match typeDef with
        | TlTypeDef(definedType, _, baseType) ->
            Assert.Equal(TlCustom("custom"), definedType)
            Assert.Equal(TlCustom("BaseType"), baseType)
        | _ -> failwith "Unexpected definition, expected type"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseFuncDef parses func with args and return type``() =
    match run parseFuncDef "function one:double two:string = ReturnType" with
    | Success(funcDef, _, _) ->
        match funcDef with
        | TlFuncDef(definedFunc, _, returnType) ->
            Assert.Equal(TlCustom("function"), definedFunc)
            Assert.Equal(TlCustom("ReturnType"), returnType)
        | _ -> failwith "Unexpected definition, expected function"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseAnnotation with description field produces annotated definition``() =
    match run parseAnnotation "@description Description text. With punctuation" with
    | Success(result, _, _) ->
        match result with
        | TlTypeAnnotation(text) ->
            Assert.Equal("Description text. With punctuation", text)
        | _ -> failwith "Unexpected annotation kind, expected type annotation"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseAnnotation with custom field name produces annotated field definition``() =
    match run parseAnnotation "@custom Description text. With punctuation" with
    | Success(result, _, _) ->
        match result with
        | TlFieldAnnotation(fieldName, text) ->
            Assert.Equal("custom", fieldName)
            Assert.Equal("Description text. With punctuation", text)
        | _ -> failwith "Unexpected annotation kind, expected field annotation"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseAnnotationList with multiple fields on a single line produces list of annotations``() =
    match run parseAnnotationList "@one First. @two Second." with
    | Success(result, _, _) ->
        match result with
        | [one; two] ->
            match one with
            | TlFieldAnnotation(id, text) ->
                Assert.Equal("one", id)
                Assert.Equal("First.", text)
            | _ -> failwith "Unexpected annotation kind, expected field annotation"
            match two with
            | TlFieldAnnotation(id, text) ->
                Assert.Equal("two", id)
                Assert.Equal("Second.", text)
            | _ -> failwith "Unexpected annotation kind, expected field annotation"
        | _ -> failwith "Unexpected number of annotations, expected 2"
    | Failure(_,error,_) -> failwith (error.ToString())

[<Fact>]
let ``parseAnnotationList with multi-line description``() =
    match run parseAnnotationList "@one First.\nSecond." with
    | Success(result, _, _) ->
        match result with
        | [one] ->
            match one with
            | TlFieldAnnotation(id, text) ->
                Assert.Equal("one", id)
                Assert.Equal("First.\nSecond.", text)
            | _ -> failwith "Unexpected annotation kind, expected field annotation"
        | _ -> failwith "Unexpected number of annotations, expected 1"
    | Failure(_,error,_) -> failwith (error.ToString())
