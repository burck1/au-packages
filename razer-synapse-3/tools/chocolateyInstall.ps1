$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'http://razerdrivers.s3.amazonaws.com/drivers/Synapse3/win/RazerSynapseInstaller_V1.0.102.135.exe'
$checksum   = 'b58a3757483c1b9108d5fd09a6a5b63c2e3442043c6ab2933c8e06a2f004018a'

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
