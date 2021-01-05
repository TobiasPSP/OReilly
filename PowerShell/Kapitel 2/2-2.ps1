# Inhaltsverzeichnis einer ZIP-Datei auslesen (ZIP-Datei muss existieren!)
[System.IO.Compression.ZipFile]::OpenRead('c:\temp\datei.zip').Entries
