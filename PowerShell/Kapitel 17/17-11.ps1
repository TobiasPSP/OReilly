'Starte.'

Get-ChildItem -Path c:\gibtesnicht

try
{
  # alle Fehler abfangen:
  $Backup = $ErrorActionPreference
  $ErrorActionPreference = 'Stop'

  1/$null
  Get-Process -Name gibtsnicht
  net user gibtsnicht
}
catch
{
  "Fehler: $_"
}
finally
{
  # vorheriges Fehlerverhalten wiederherstellen:
  $ErrorActionPreference = $Backup
}

'Fertig.'
