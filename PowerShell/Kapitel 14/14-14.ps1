function Ping-Computer
{
  param
  (
    [ValidateCount(1,5)]
    [String[]]
    $ComputerName = $env:COMPUTERNAME
  )

  foreach($Name in $ComputerName)
  {
    $info = [Ordered]@{}
    $info.ComputerName = $Name
    $info.Online = (@(ping.exe $Name -n 1 -w 500) -match '\dms').Count -gt 0

    New-Object -TypeName PSObject -Property $info
  }
}
