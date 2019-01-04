$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'https://dl.razerzone.com/drivers/Synapse3/win/RazerSynapseInstaller_V1.0.97.127.exe'
$checksum   = 'a998f804b0353b3e842feb672c0b2f826182ce6a8efb6f5532388464bb500ca3'

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
