#requires -Version 1

# RECENT-Dateien löschen
Get-ChildItem -Path "$env:appdata\Microsoft\Windows\Recent" -Filter *.lnk | 
  Remove-Item 

# TEMP-Ordner löschen
Get-ChildItem -Path $env:temp | Remove-Item  -Recurse -ErrorAction SilentlyContinue
