$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'http://dl.razerzone.com/drivers/Synapse2/win/Razer_Synapse_Installer_v2.21.21.0.exe'
$checksum   = 'ABC'

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
