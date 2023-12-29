param(
    [string] $RefName
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

Write-Host "Determining version from ref $RefName…"
if ($RefName -match '^refs/tags/v') {
    $version = $RefName -replace '^refs/tags/v', ''
    Write-Host "Pushed ref is a version tag, version: $version"
} else {
    $propsFilePath = "$PSScriptRoot/../Directory.Build.props"
    [xml] $props = Get-Content $propsFilePath
    $version = $props.Project.PropertyGroup.Version
    Write-Host "Pushed ref is a not version tag, get version from $($propsFilePath): $version"
}

Write-Output "version=$version"
