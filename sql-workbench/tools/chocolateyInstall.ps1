$ErrorActionPreference = 'Stop'

# DO NOT CHANGE THESE MANUALLY. USE update.ps1
$url      = 'https://www.sql-workbench.eu/Workbench-Build123.zip'
$checksum = 'ABC'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$sqlWorkbench = Join-Path $toolsDir 'SQLWorkbench.exe'
$sqlWorkbench64 = Join-Path $toolsDir 'SQLWorkbench64.exe'
$sqlwbconsole = Join-Path $toolsDir 'sqlwbconsole.exe'
$sqlwbconsole64 = Join-Path $toolsDir 'sqlwbconsole64.exe'

# Create .ignore and .gui files based on OS
if (Get-ProcessorBits -Compare 64) {
  New-Item "$sqlWorkbench.ignore" -Type File -Force | Out-Null
  New-Item "$sqlwbconsole.ignore" -Type File -Force | Out-Null
  New-Item "$sqlWorkbench64.gui" -Type File -Force | Out-Null
} else {
  New-Item "$sqlWorkbench64.ignore" -Type File -Force | Out-Null
  New-Item "$sqlwbconsole64.ignore" -Type File -Force | Out-Null
  New-Item "$sqlWorkbench.gui" -Type File -Force | Out-Null
}

$packageArgs = @{
  packageName            = $env:ChocolateyPackageName
  unzipLocation          = $toolsDir
  url                    = $url
  checksum               = $checksum
  checksumType           = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# If this is a 64 bit OS, create a secondary shim
if (Get-ProcessorBits -Compare 64) {
  Install-BinFile -Name 'SQLWorkbench' -Path $sqlWorkbench64 -UseStart
  Install-BinFile -Name 'sqlwbconsole' -Path $sqlwbconsole64
}
