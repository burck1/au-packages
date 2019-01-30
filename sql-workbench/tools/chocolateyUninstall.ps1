$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$sqlWorkbench64 = Join-Path $toolsDir 'SQLWorkbench64.exe'
$sqlwbconsole64 = Join-Path $toolsDir 'sqlwbconsole64.exe'

# If this is a 64 bit OS, remove the secondary shim
if (Get-ProcessorBits -Compare 64) {
  Uninstall-BinFile -Name 'SQLWorkbench' -Path $sqlWorkbench64
  Uninstall-BinFile -Name 'sqlwbconsole' -Path $sqlwbconsole64
}
