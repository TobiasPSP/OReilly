powershell -NoProfile -Command "Get-Service | Where-Object CanStop | Out-GridView -Title \"Welchen Dienst stoppen?\" -PassThru | Stop-Service -whatIf"
