#requires -Version 2

$Path32Bit = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
$Path64Bit = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'

Get-ItemProperty -Path $Path32Bit, $Path64Bit |
  Select-Object -Property DisplayName, DisplayVersion, UninstallString |
  Out-GridView
