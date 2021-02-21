# Datei anlegen:

# Pfadnamen zum Desktop feststellen (Windows)
$desktop = [Environment]::GetFolderPath('Desktop')

# Pfadnamen für Original und Kopie festlegen:
$original = Join-Path -Path $desktop -ChildPath 'original.txt'
$kopie = Join-Path -Path $desktop -ChildPath 'kopie.txt'

# Originaldatei herstellen:
"Hallo Welt" | Set-Content -Path $original -Encoding UTF8

# Sicherheitskopie erstellen:
Copy-Item -Path $original -Destination $kopie

# die zwei zuletzt geänderten Dateien auf dem Desktop auflisten:
Get-ChildItem -Path $desktop -File | 
  Sort-Object -Property LastWriteTime -Descending | 
  Select-Object -First 2
