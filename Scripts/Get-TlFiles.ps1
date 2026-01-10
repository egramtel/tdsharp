# SPDX-FileCopyrightText: 2024-2025 tdsharp contributors <https://github.com/egramtel/tdsharp>
#
# SPDX-License-Identifier: MIT

param(
    [string] $CommitHash = '0da5c72f8365fb4857096e716d53175ddbdf5a15',
    [string] $TdApiUrl = "https://github.com/tdlib/td/raw/$CommitHash/td/generate/scheme/td_api.tl",

    [string] $SourceRoot = "$PSScriptRoot/..",
    [string] $CodeGenPath = "$SourceRoot/TdLib.CodeGen"
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$apiText = (Invoke-WebRequest $TdApiUrl).Content -split "\r?\n"

$targetFile = "$CodeGenPath/Types.tl"
$skipInitialLines = $true
Remove-Item $targetFile
$emptyLineBuffer = @()

foreach ($line in $apiText) {
    if ($line.Trim() -eq '---functions---') {
        $targetFile = "$CodeGenPath/Methods.tl"
        Remove-Item $targetFile
        $skipInitialLines = $true
        $emptyLineBuffer = @()
        continue
    }

    if ($line.Trim() -eq '') {
        if ($skipInitialLines) {
            continue
        }

        $emptyLineBuffer += $line
        continue
    } else {
        $skipInitialLines = $false
        if ($emptyLineBuffer.Length -ge 0) {
            foreach ($emptyLine in $emptyLineBuffer) {
                $emptyLine | Out-File $targetFile -Encoding utf8 -Append
            }
            $emptyLineBuffer = @()
        }
    }

    $line | Out-File $targetFile -Encoding utf8 -Append
}
