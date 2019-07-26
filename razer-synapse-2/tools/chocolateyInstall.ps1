$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'https://dl.razerzone.com/drivers/Synapse2/win/Web_Razer_Synapse_Installer_v2.21.24.1.exe'
$checksum   = '74cdb893f072b1953db0c6679b38174ddd2e2d683ce4d8fef2d4cca5c47728c6'

$packageArgs = @{
  packageName            = $env:ChocolateyPackageName
  fileType               = 'EXE'
  url                    = $url
  checksum               = $checksum
  checksumType           = 'sha256'
  softwareName           = 'Razer Synapse'
  silentArgs             = "/S /v/qn"
  validExitCodes         = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
