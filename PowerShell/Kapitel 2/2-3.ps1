# benötigte .NET Bibliothek laden:
Add-Type -AssemblyName System.IO.Compression.FileSystem

# ZIP-Datei öffnen (ZIP-Datei muss existieren!)
$datei = [System.IO.Compression.ZipFile]::OpenRead('c:\temp\datei.zip')

# Inhaltsverzeichnis auslesen:
$datei.Entries

# Datei wieder schließen und Speicher freigeben:
$datei.Dispose()
