$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url        = 'http://razerdrivers.s3.amazonaws.com/drivers/Synapse3/win/RazerSynapseInstaller_V1.0.103.136.exe'
$checksum   = '8df4da4615f4ef35c590c419d3787ad36ee471930965c56353aabb73a65bea9e'

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
