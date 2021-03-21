function Ping-Computer
{
  param
  (
    [ValidateLength(5,10)]
    [String]
    $ComputerName = $env:COMPUTERNAME
  )

  # Computer anpingen. Wenn das Ergebnis eine Zahl gefolgt von "ms" liefert,
  # $true zurückliefern, sonst $false:
  (@(ping.exe $ComputerName -n 1 -w 500) -match '\dms').Count -gt 0
}
