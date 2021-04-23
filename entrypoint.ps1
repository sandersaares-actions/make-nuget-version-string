$ErrorActionPreference = "Stop"

Import-Module sandersaares.devops-scripts

if ($env:INPUT_RELEASETYPE -eq "stable") {
    Set-NuGetVersionString -buildNumber $env:INPUT_VERSIONSTRING -stableVersion
}
elseif ($env:INPUT_RELEASETYPE -eq "preview") {
    Set-NuGetVersionString -buildNumber $env:INPUT_VERSIONSTRING -previewVersion
}
elseif ($env:INPUT_RELEASETYPE -eq "cb") {
    Set-NuGetVersionString -buildNumber $env:INPUT_VERSIONSTRING
}
else {
    Write-Error "Unsupported releaseType attribute: $($env:INPUT_RELEASETYPE)"
}