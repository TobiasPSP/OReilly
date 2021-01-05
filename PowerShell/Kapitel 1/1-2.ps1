$code = Invoke-RestMethod -Uri https://aka.ms/install-powershell.ps1
New-Item -Path function: -Name Install-PowerShell -Value $code
