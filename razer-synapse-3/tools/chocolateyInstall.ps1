$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'https://dl.razerzone.com/drivers/Synapse3/win/RazerSynapseInstaller_V1.0.100.133.exe'
$checksum   = '4b4bcf96c1d8eeda95bb2592b80864061a2f2af63184fdc247155aad8c5db2c5'

$packageArgs = @{
  packageName            = $env:ChocolateyPackageName
  fileType               = 'EXE'
  url                    = $url
  checksum               = $checksum
  checksumType           = 'sha256'
  softwareName           = 'Razer Synapse'

  # UNKNOWN at this time. Will require an 'attended' install.
  # silentArgs = "/SLIENT"
}

Install-ChocolateyPackage @packageArgs
