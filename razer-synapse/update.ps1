#Requires -Version 5.0
#Requires -Modules AU
[cmdletbinding()]
param (
  [switch]$Force
)

. "$PSScriptRoot\..\razer-synapse-2\update.ps1"

$ErrorActionPreference = 'Stop'

function global:au_BeforeUpdate {
  # Override au_BeforeUpdate in razer-synapse-2
  # I.E. Skip getting the checksum
}

function global:au_SearchReplace {
  @{
    "razer-synapse.nuspec" = @{
      "(\<dependency .+? version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
    }
  }
}

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
Update-Package -NoCheckUrl -NoCheckChocoVersion -NoReadme -ChecksumFor none -Force:$Force
