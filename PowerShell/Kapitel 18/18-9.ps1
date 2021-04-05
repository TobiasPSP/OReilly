$anmeldung = Get-Credential "$env:USERDOMAIN\$env:USERNAME"
$code = 
{
  param($Credential)
  Get-WmiObject Win32_OperatingSystem -ComputerName storage1 -Credential $Credential |
    Select-Object -ExpandProperty Caption
}

Invoke-Command -ScriptBlock $code -ComputerName testserver -ArgumentList $anmeldung
