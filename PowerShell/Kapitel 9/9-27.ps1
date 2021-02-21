(qprocess) -replace '\s{1,}',','  | Foreach-Object { $_.SubString(1) } | ConvertFrom-Csv | Out-GridView
