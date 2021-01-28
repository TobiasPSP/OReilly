# Ordner anlegen, in dem die ZIP-Datei gespeichert werden soll:
New-Item -Path c:\meineZipDateien -ItemType Directory -ErrorAction Ignore

# alle PowerShell-Skripte im Benutzerprofil suchen
# (ändern die den Dateityp und "zippen" Sie andere Dateiarten,
# falls Sie noch gar keine PowerShell-Skripte besitzen)
Get-ChildItem -Path $home -Filter *.ps1 -Recurse -ErrorAction Ignore |
# in eine ZIP-Datei speichern:
Compress-Archive -DestinationPath 'c:\meineZipDateien\meineSkripte.zip'

# Datei anzeigen
Get-Item -Path 'c:\meineZipDateien\meineSkripte.zip'
