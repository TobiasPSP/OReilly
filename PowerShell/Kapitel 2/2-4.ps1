# Ausgabeordner anlegen:
$null = New-Item -Path c:\temp\inhalte -ItemType Directory -ErrorAction Ignore

# die .NET Bibliothek nachladen, die Expand-Archive nutzt:
Add-Type -AssemblyName System.IO.Compression.FileSystem

# ZIP-Datei zum Lesen öffnen (die Datei muss natürlich existieren):
$zip = [System.IO.Compression.ZipFile]::OpenRead('c:\temp\datei.zip')

# Alle Dateien in der ZIP-Datei auflisten...
$zip.Entries | 
  # ...nur die Dateien wählen, die auf "PNG" enden...
  Where-Object { $_.FullName -like '*.png' } |
  # ...und diese alle in den gewünschten Zielordner auspacken 
  # (Zielordner muss existieren):
  ForEach-Object { 
    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_,
                                           "c:\temp\inhalte\$_", 
                                           $true) 
  }
  
# ZIP-Datei wieder schließen
$zip.Dispose()

# Zielordner im Explorer öffnen:
explorer c:\temp\inhalte
