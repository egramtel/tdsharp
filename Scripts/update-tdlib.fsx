// SPDX-FileCopyrightText: 2025 Friedrich von Never <friedrich@fornever.me>
//
// SPDX-License-Identifier: MIT

#r "nuget: TruePath, 1.10.0"
#r "nuget: TruePath.SystemIo, 1.10.0"
#r "nuget: Octokit, 14.0.0"
#r "nuget: MedallionShell, 1.6.2"

open System
open System.IO
open System.Text.RegularExpressions
open System.Xml.Linq
open Medallion.Shell
open Octokit
open TruePath
open TruePath.SystemIo

let repoRoot = AbsolutePath __SOURCE_DIRECTORY__ / ".."

let directoryBuildProps = repoRoot / "Directory.Build.props"
let getTlFiles = repoRoot / "Scripts/Get-TlFiles.ps1"

let readCurrentVersion() =
    if not <| directoryBuildProps.Exists() then
        failwithf $"Directory.Build.props not found at expected path: \"{directoryBuildProps.Value}\"."

    let doc = XDocument.Load directoryBuildProps.Value
    let versionString =
        doc.Descendants(XName.Get "Version")
        |> Seq.tryExactlyOne
        |> Option.map _.Value.Trim()
        |> Option.map Version.Parse

    match versionString with
    | Some v -> v
    | None -> failwith "Directory.Build.props does not contain a valid <Version> element."

let tagNamePrefix = "tdlib/"
let tagNameToVersion(name: string) =
    let name = name.Substring tagNamePrefix.Length
    if not <| name.StartsWith "v" then failwithf $"Version number is expected to start with 'v', actual: {name}."
    Version.Parse(name.Substring 1)

let readLatestVersion() = task {
    let client = GitHubClient(ProductHeaderValue("tdlib-versioned"))
    match Environment.GetEnvironmentVariable "GITHUB_TOKEN" |> Option.ofObj with
    | Some token ->
        printfn "Found GitHub token credentials in environment, will use."
        client.Credentials <- Credentials token
    | None -> ()

    let! allTags = client.Repository.GetAllTags("ForNeVeR", "tdlib-versioned")

    return
        allTags
        |> Seq.filter (fun t -> t.Name.StartsWith tagNamePrefix)
        |> Seq.maxBy (fun t -> tagNameToVersion t.Name)
}

let updateTlScript commitHash =
    let content = getTlFiles.ReadAllText()
    let versionRegex = Regex @"\$CommitHash = '.*?'"
    let newContent = versionRegex.Replace(content, $"$CommitHash = '{commitHash}'")
    getTlFiles.WriteAllText newContent

let processCommandResult(result: CommandResult) =
    if result.StandardOutput.Length > 0 then printfn $"%s{result.StandardOutput}"
    if result.StandardError.Length > 0 then printfn $"Standard error: %s{result.StandardError}"
    if not result.Success then failwithf $"Command failed with exit code {result.ExitCode}."

let runTlScript() =
    printfn $"Running {getTlFiles.FileName}…"
    Command.Run("pwsh", getTlFiles.Value).Result |> processCommandResult
    printfn $"{getTlFiles.FileName} executed successfully."

let removeOldGeneratedFiles() =
    let folders = [|
        repoRoot / "TdLib.Api" / "Objects"
        repoRoot / "TdLib.Api" / "Functions"
    |]
    for folder in folders do
        if folder.ExistsDirectory() then
            printfn $"Removing folder \"{folder.Value}\"…"
            folder.DeleteDirectoryRecursively()
        else printfn $"Nothing to clean in \"{folder.Value}\": folder doesn't exist."

let regenerateFiles() =
    let tdLibApiFolder = repoRoot / "TdLib.Api"
    let codeGenFolder = repoRoot / "TdLib.CodeGen"

    printfn "Regenerating API definitions…"
    Command.Run(
        "dotnet",
        arguments = [| "run"; "--project"; codeGenFolder.Value |],
        options = fun opts -> opts.WorkingDirectory tdLibApiFolder.Value |> ignore
    ).Result |> processCommandResult
    printfn "API definitions regenerated successfully."

let updateGeneratedFiles() =
    removeOldGeneratedFiles()
    regenerateFiles()

let updateVersion(version: string) =
    let currentContent = directoryBuildProps.ReadAllText()
    let versionRegex = Regex "<Version>.*?</Version>"
    let newContent = versionRegex.Replace(currentContent, $"<Version>{version}</Version>")
    directoryBuildProps.WriteAllText newContent

let updateChangelog(version: string) =
    let changelogFile = repoRoot / "CHANGELOG.md"
    let changelog = changelogFile.ReadAllText()

    let firstReleasedSection = changelog.IndexOf "##"
    let newChangelog = changelog.Insert(firstReleasedSection, $"## [Unreleased] ({version})\n### Changed\n- Update to [TDLib v{version}](https://github.com/ForNeVeR/tdlib-versioned/releases/tag/tdlib%%2Fv{version}).\n\n")
    changelogFile.WriteAllText newChangelog

let updateTo (tag: RepositoryTag) =
    let version = tag.Name.Substring(tagNamePrefix.Length + 1)

    updateTlScript tag.Commit.Sha
    runTlScript()
    updateGeneratedFiles()

    updateVersion version
    updateChangelog version

    {|
        BodyMarkdown = $"Update TDLib to version {version} and regenerate the API definitions."
        BranchName = $"dependencies/tdlib-{version}"
        CommitMessage = $"Update TDLib to {version}"
        PullRequestTitle = $"TDLib {version}"
    |}

let currentVersion = readCurrentVersion()
let latestTag = readLatestVersion().Result
let latestVersion = tagNameToVersion latestTag.Name

let result =
    printfn $"Current version: {currentVersion}, latest version: {latestVersion}."
    if currentVersion < latestVersion then
        printfn $"Updating to {latestVersion}…"
        Some <| updateTo latestTag
    else
        printfn "Nothing to do."
        None

let writeResults() =
    let output = Environment.GetEnvironmentVariable "GITHUB_OUTPUT" |> Option.ofObj
    use outputStream =
        match output with
        | None ->
            printfn "No GITHUB_OUTPUT env var provided, results will be written to the standard output."
            Console.OpenStandardOutput()
        | Some path -> File.OpenWrite path

    use writer = new StreamWriter(outputStream)

    let serializeParameter key (value: string) =
        if value.Contains("\n") then
            let delimiter = Guid.NewGuid()
            writer.Write $"{key}<<{delimiter}\n{value}\n{delimiter}\n"
        else
            writer.Write $"{key}={value}\n"

    let fromBool = function | true -> "true" | false -> "false"

    serializeParameter "has-changes" (fromBool <| Option.isSome result)

    match result with
    | None -> ()
    | Some result ->
        serializeParameter "body" result.BodyMarkdown
        serializeParameter "branch-name" result.BranchName
        serializeParameter "commit-message" result.CommitMessage
        serializeParameter "title" result.PullRequestTitle

writeResults()
