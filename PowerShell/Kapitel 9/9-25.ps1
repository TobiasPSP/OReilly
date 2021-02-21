# Pfad zur Logbuchdatei (im vorangegangenen Beispiel generiert):
$Path = "$env:temp\logfile.csv"
$muster = ',"(\w{1,}\.\w{1,})",.{1,}?,"(\d{1,})",'

Get-Content -Path $path |
  Where-Object { $_ -match $muster } |
  ForEach-Object { 
    [PSCustomObject]$matches    
  }
