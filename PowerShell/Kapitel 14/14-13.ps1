function Ping-Computer
{
  param
  (
    [ValidatePattern('^Server\d{1,3}$')]
    [String]
    $ComputerName = $env:COMPUTERNAME
  )

  # Computer anpingen. Wenn das Ergebnis eine Zahl gefolgt von "ms" liefert,
  # $true zurückliefern, sonst $false:
  (@(ping.exe $ComputerName -n 1 -w 500) -match '\dms').Count -gt 0
}
