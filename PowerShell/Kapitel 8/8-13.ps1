Get-Process | Foreach-Object { if ($_.Company -like '*Microsoft*') { $_ } } | Select-Object -Property Name, Company, Description, Id
