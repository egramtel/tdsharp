// SPDX-FileCopyrightText: 2024 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

module TdLib.CodeGen.GeneratorTests

open Xunit

open TdLib.CodeGen.Generator
open TdLib.CodeGen.Parser

[<Fact>]
let ``vector field``(): unit =
    let ``type`` = TlTypeDef(TlType.TlCustom "tt", [], TlType.TlCustom "base")
    let field = {
        TlField.FieldName = "field"
        TlField.TypeName = TlType.TlVector (TlType.TlCustom "foo")
    }
    let expected =
        "    /// <summary>\n" +
        "    /// \n" +
        "    /// </summary>\n" +
        "    [JsonProperty(\"field\", ItemConverterType = typeof(Converter))]\n" +
        "    public Foo[] Field { get; set; }"
    let generated = generateField ``type`` field [] 4
    Assert.Equal(expected,  generated)

[<Fact>]
let ``normal field``(): unit =
    let ``type`` = TlDef.TlTypeDef(TlType.TlCustom "tt", [], TlType.TlCustom "base")
    let field = { TlField.FieldName = "field"; TlField.TypeName = TlType.TlCustom "foo" }
    let expected =
        "    /// <summary>\n" +
        "    /// \n" +
        "    /// </summary>\n" +
        "    [JsonConverter(typeof(Converter))]\n" +
        "    [JsonProperty(\"field\")]\n" +
        "    public Foo Field { get; set; }"
    let generated = generateField ``type`` field [] 4
    Assert.Equal(expected,  generated)
