$code = Invoke-RestMethod -Uri https://tinyurl.com/codeAusBuch
$null = New-Item -Path function: -Name Get-SampleCode -Value $code -Force
Set-Alias -Name l -Value Get-SampleCode
