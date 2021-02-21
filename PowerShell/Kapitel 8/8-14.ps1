ping powershell.one -n 1 -w 2000 | Out-Null 
if ($LASTEXITCODE -eq 0) { 'erreichbar' }
