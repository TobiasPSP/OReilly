# alle Logdateien finden:
$logfiles = Get-ChildItem -Path $env:windir -Recurse -File -Filter *.log -ErrorAction Ignore

# jede gefundene Logdatei...
$ergebnis = foreach($file in $logfiles)
{
  # ...nach Zeilen durchsuchen, die das Suchwort enthalten
  $trefferliste = Select-String -Path $file.FullName -Pattern Error -ErrorAction Ignore


  # alle gefundenen Treffer der Reihe nach verarbeiten...
  foreach($treffer in $trefferliste)
  {
    # und die gewünschten Eigenschaften zurückgeben:
    Select-Object -InputObject $treffer -Property LineNumber, Path, Line
  }
}

# Endergebnis komplett an das GridView senden:
$ergebnis | Out-GridView
