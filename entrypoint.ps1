$ErrorActionPreference = "Stop"

Import-Module Axinom.DevOpsTooling

if ($env:INPUT_RELEASETYPE -eq "stable") {
    $version = Set-NuGetVersionString -buildNumber $env:INPUT_VERSIONSTRING -stableVersion
}
elseif ($env:INPUT_RELEASETYPE -eq "preview") {
    $version = Set-NuGetVersionString -buildNumber $env:INPUT_VERSIONSTRING -previewVersion
}
elseif ($env:INPUT_RELEASETYPE -eq "cb") {
    $version = Set-NuGetVersionString -buildNumber $env:INPUT_VERSIONSTRING
}
else {
    Write-Error "Unsupported releaseType attribute: $($env:INPUT_RELEASETYPE)"
}

Write-Host "::set-output name=nugetVersionstring::$version"