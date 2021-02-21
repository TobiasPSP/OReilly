$heute = Get-Date
$stichtag = $heute.AddDays(-10)


Get-WinEvent -FilterHashtable @{ 
  LogName = 'System'
  Level = 1,2,3
  StartTime = $stichtag
  } | 
  Group-Object -Property ProviderName -NoElement |
  Sort-Object -Property Count -Descending |
  Format-Table -AutoSize
