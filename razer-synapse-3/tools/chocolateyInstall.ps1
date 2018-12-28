$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'https://dl.razerzone.com/drivers/Synapse3/win/RazerSynapseInstaller_V1.0.87.115.exe'
$checksum   = 'ABC'

$packageArgs = @{
  packageName            = $env:ChocolateyPackageName
  fileType               = 'EXE'
  url                    = $url
  checksum               = $checksum
  checksumType           = 'sha256'
  softwareName           = 'Razer Synapse 3'
  silentArgs             = "/S /v/qn"
  validExitCodes         = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
