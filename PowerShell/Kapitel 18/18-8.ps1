$code = 
{
  Get-WmiObject Win32_OperatingSystem -ComputerName storage1 |
    Select-Object -ExpandProperty Caption
}

Invoke-Command -ScriptBlock $code -ComputerName testserver
