# dieser Ordner soll existieren:
$Path = 'c:\neuerordner2'

# Ordner anlegen, wenn er fehlt
# (Ternary-Operator existiert NICHT in Windows PowerShell!)
(Test-Path -Path $Path) ? (Write-Warning "Ordner '$path' war bereits vorhanden.") : $($null = New-Item -Path $Path -ItemType Directory; Write-Warning 'Neuer Ordner angelegt')
