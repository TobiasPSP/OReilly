$result = driverquery.exe /FO CSV 
ConvertFrom-Csv -InputObject $result
