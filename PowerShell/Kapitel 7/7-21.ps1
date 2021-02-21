$zielordner = 'C:\LogFiles'
# Zielordner anlegen oder überschreiben, falls vorhanden
# ACHTUNG: Ein vorhandener Zielordner wird komplett gelöscht!
$null = New-Item -Path $zielordner -ItemType Directory -Force

# alle .log-Dateien im Windows-Ordner finden und in Zielordner kopieren
Get-ChildItem -Path $env:windir -Filter *.log -Recurse -ErrorAction Ignore -File |
  Copy-Item -Destination $zielordner -ErrorAction SilentlyContinue -ErrorVariable e

# Kopierfehler anzeigen:
$e.CategoryInfo | Select-Object -Property Reason, TargetName

# Zielordner öffnen
explorer $zielordner
