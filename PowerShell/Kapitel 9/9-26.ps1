# Pfad zur Logbuchdatei (im vorangegangenen Beispiel generiert):
$Path = "$env:temp\logfile.csv"
$muster = ',"(?<Name>\w{1,}\.\w{1,})",.{1,}?,"(?<Größe>\d{1,})",'

Get-Content -Path $path |
  Where-Object { $_ -match $muster } |
  ForEach-Object { 
    $matches.Remove(0)
    [PSCustomObject]$matches    
  }
