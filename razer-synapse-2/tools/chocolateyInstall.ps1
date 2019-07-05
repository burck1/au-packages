$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'http://dl.razerzone.com/drivers/Synapse2/win/Web_Razer_Synapse_Installer_v2.21.23.1.exe'
$checksum   = 'adcb671b790eb4cb179d4a8686ba9c7ac31c15427125678c08cd93a274175127'

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
