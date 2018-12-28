#Requires -Version 5.0
#Requires -Modules AU
[cmdletbinding()]
param (
  [switch]$Force
)

$ErrorActionPreference = 'Stop'

$razerSynapseUrl = 'http://rzr.to/synapse-pc-download'

function global:au_BeforeUpdate() {
  $cs = Get-RemoteChecksum -Url $Latest.Url32 -Algorithm 'SHA256'
  $Latest.Checksum32 = $cs
  $Latest.Checksum64 = $cs
}

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^[$]url\s*=\s*)'.*'"        = "`${1}'$($Latest.URL32)'"
      "(?i)(^[$]url64\s*=\s*)'.*'"      = "`${1}'$($Latest.URL64)'"
      "(?i)(^[$]checksum\s*=\s*)'.*'"   = "`${1}'$($Latest.Checksum32)'"
      "(?i)(^[$]checksum64\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
  $response = Invoke-WebRequest -Uri $razerSynapseUrl -UseBasicParsing -MaximumRedirection 0 -ErrorAction Ignore
  if ($response.StatusCode -ne 302) {
    throw "HTTP $($response.StatusCode) when requesting $razerSynapseUrl"
  }
  if (-not $response.Headers.Location) {
    throw "No Location header returned when requesting $razerSynapseUrl"
  }

  $downloadUrl = $response.Headers.Location
  if (-not ($downloadUrl -match '.*_v(?<Version>.*)\.exe')) {
    throw "Could not determine version from url $downloadUrl"
  }
  $version = $matches.Version

  return @{
    Version        = $version
    URL32          = $downloadUrl
    URL64          = $downloadUrl
  }
}

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
Update-Package -NoCheckUrl -NoCheckChocoVersion -NoReadme -ChecksumFor none -Force:$Force
