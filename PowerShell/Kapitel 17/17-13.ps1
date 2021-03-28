$Backup = $ErrorActionPreference
$ErrorActionPreference = 'Stop'

trap
{
  "Fehler: $_"

  # Fehler ist behandelt, also nicht an PowerShell weitergeben:
  continue
}

'Starte.'

Get-ChildItem -Path c:\gibtesnicht

& {
    1/$null
    Get-Process -Name gibtsnicht
    net user gibtsnicht
}

# vorheriges Fehlerverhalten wiederherstellen:
$ErrorActionPreference = $Backup

'Fertig.'
