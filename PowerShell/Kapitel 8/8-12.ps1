Get-Process | Where-Object { $_.Company -like '*Microsoft*' } | Select-Object -Property Name, Company, Description, Id
