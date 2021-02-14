Invoke-RestMethod -Uri https://aka.ms/install-powershell.ps1 -UseBasicParsing | New-Item -Path function: -Name Install-PowerShell | Out-Null
