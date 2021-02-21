#requires -Version 1

# Pfadnamen zum Desktop feststellen (Windows)
$desktop = [Environment]::GetFolderPath('Desktop')

# Pfadnamen definieren:
$path = Join-Path -Path $desktop -ChildPath datei.txt

# Ergebnisse von Get-Process in Textdatei speichern:
Get-Process | Format-Table -AutoSize -Wrap | Out-File -FilePath $path -Width 120

# Ausgabedatei umbenennen
Rename-Item -Path $path -NewName prozesse.txt
