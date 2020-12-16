#requires -RunAsAdmin
# (in einer PowerShell mit vollen Administrator-Rechten ausführen!)

# diese Werte bei Bedarf anpassen:
# app hier speichern
$destination = 'c:\meinePortablePowerShell'

# suchen nach folgender app:
$search = 'powershell'

# alle installierten Microsoft Store-apps durchsuchen...
Get-ChildItem "$env:programfiles\WindowsApps\" | 
# App mit Suchwort im Namen auswählen...
Where-Object name -like "*$search*" | 
# Anwendung finden...
Get-ChildItem -Filter *.exe | 
# Version der Anwendung finden...
Select-Object -ExpandProperty VersionInfo | 
# Versionen absteigend sortieren...
Sort-Object -Property ProductVersion -Descending | 
# höchste Version wählen...
Select-Object -First 1 -ExpandProperty filename | 
# gefundenen Anwendungsnamen in Variable $anwendung kopieren...
Tee-Object -Variable anwendung |
# Ordner finden, in dem die Anwendung liegt...
Split-Path | 
# Ordnerinhalt auflisten...
Get-ChildItem | 
# Ordnerinhalt in Zielordner kopieren...
Copy-Item -Destination $destination -Force

# Zielordner im Explorer öffnen:
explorer $destination

# Dateiname aus Pfad extrahieren:
$name = Split-Path -Path $anwendung -Leaf

# Startbefehl der neu kopierten App ausgeben:
"$destination\$name"
