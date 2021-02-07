function Expand-ArchivePart
{
  param
  (
    [String]
    [Parameter(Mandatory)]
    $Path,
  
    [String]
    [Parameter(Mandatory)]
    $Destination,
    
    [String]
    $Filter = '*'
  )
  
  # Zielordner anlegen, falls er noch nicht existiert:
  $exists = Test-Path -Path $Destination
  if ($exists -eq $false)
  {
    $null = New-Item -Path $Destination -ItemType Directory 
  }
  
  Add-Type -AssemblyName System.IO.Compression.FileSystem

  $zip = [System.IO.Compression.ZipFile]::OpenRead($Path)

  # Alle Dateien in der ZIP-Datei auflisten...
  $zip.Entries | 
  # ...nur die Dateien wählen, die auf "PNG" enden...
  Where-Object { $_.FullName -like $Filter } |
  # ...und diese alle in den gewünschten Zielordner auspacken 
  # (Zielordner muss existieren):
  ForEach-Object { 
    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_,
      "$Destination\$_", 
    $true) 
  }

  # ZIP-Datei wieder schließen
  $zip.Dispose()
}
