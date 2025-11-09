// SPDX-FileCopyrightText: 2024-2025 tdsharp contributors <https://github.com/egramtel/tdsharp>
//
// SPDX-License-Identifier: MIT

module TdLib.CodeGen.Program

open System.IO

[<EntryPoint>]
let main _ =
    let writeFile folder name (source: string) =
        if not (Directory.Exists(folder)) then
            Directory.CreateDirectory(folder) |> ignore
        File.WriteAllText(folder + "/" + name, source)

    for name, source in Generator.generateAllTypes() do
        writeFile "Objects" (name + ".cs") source

    for name, source in Generator.generateAllFuncs() do
        writeFile "Functions" (name + ".cs") source

    0
