$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'http://dl.razerzone.com/drivers/Synapse2/win/Razer_Synapse_Installer_v2.21.21.1.exe'
$url64      = 'http://dl.razerzone.com/drivers/Synapse2/win/Razer_Synapse_Installer_v2.21.21.1.exe'
$checksum   = '40a8baca006828d8dd73ba2be98e0eb244a5227b1a5661108153889d14540cfd'
$checksum64 = '40a8baca006828d8dd73ba2be98e0eb244a5227b1a5661108153889d14540cfd'

$packageArgs = @{
  packageName            = $env:ChocolateyPackageName
  fileType               = 'EXE'
  url                    = $url
  url64bit               = $url64
  checksum               = $checksum
  checksum64             = $checksum64
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  softwareName           = 'Razer Synapse'
  silentArgs             = "/S /v`"/l* '$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log' /qn`""
  validExitCodes         = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
