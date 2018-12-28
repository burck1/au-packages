$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'https://dl.razerzone.com/drivers/Synapse3/win/RazerSynapseInstaller_V1.0.87.116.exe'
$checksum   = '2096cc8e75dd6175700654eaffd5117cf2f87f9cb20429a52ed389bc1f9b9817'

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
