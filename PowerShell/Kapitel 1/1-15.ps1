# grüne Fehlermeldungen (kommentieren Sie die nächste Zeile ein,
# wenn Sie das wirklich wollen:
# $host.PrivateData.ErrorForegroundColor = 'Green'


# Funktion zum Herunterladen der Beispielskripte in diesem Buch:
Invoke-RestMethod -Uri https://tinyurl.com/codeAusBuch | 
New-Item -Path function: -Name L -Force | 
Out-Null
