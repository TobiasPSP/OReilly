Get-Process | & {process {if ($_.Company -like '*Microsoft*') {$_}}} | Select-Object -Property Name, Company, Description, Id
