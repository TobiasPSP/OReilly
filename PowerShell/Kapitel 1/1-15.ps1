
# grüne Fehlermeldungen (kommentieren Sie die nächste Zeile ein,
# wenn Sie das wirklich wollen:
# $host.PrivateData.ErrorForegroundColor = 'Green'


# Funktion zum Herunterladen der Beispielskripte in diesem Buch:
$code = Invoke-RestMethod -Uri https://tinyurl.com/codeAusBuch
$null = New-Item -Path function: -Name Get-SampleCode -Value $code -Force
Set-Alias -Name l -Value Get-SampleCode
