$kriterium1 = @{Expression='Company'; Ascending=$true }
$kriterium2 = @{Expression='CPU'; Descending=$true }
Get-Process | Where-Object { $_.Company -ne $null } | Sort-Object $kriterium1, $kriterium2 | Select-Object Company, CPU
