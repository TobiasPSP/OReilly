(Get-Process -Id $Pid).PriorityClass = 'BelowNormal'
