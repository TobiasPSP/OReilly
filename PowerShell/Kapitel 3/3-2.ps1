# testordner anlegen:
# (ändern Sie den Namen des Testordners bei Bedarf)
$testordner = 'c:\testordner'
$null = New-Item -Path c:\testordner -ItemType Directory -ErrorAction Ignore

# testscript anlegen:
$skript = Join-Path -Path $testordner -ChildPath 'Stop-LaufendeDienste.ps1'
{
  Get-Service | 
  Where-Object CanStop | 
  Out-GridView -Title "Welchen Dienst stoppen?" -PassThru |
  Stop-Service -whatIf
} | Out-File -FilePath $skript

Write-Warning "Neues Skript angelegt: $skript"

# Ordner, in dem das Skript liegt, für die Dauer dieser PowerShell-
# Sitzung in die Umgebungsvariable $env:path aufnehmen:
# (die Variable enthält eine Semikolon-separierte Liste mit Ordner-
#  namen, die automatisch vom Betriebssystem durchsucht werden,
#  wenn keine absoluten Pfadnamen verwendet werden)
$env:Path += ";$testordner"

# Skript kann nun allein über seinen Namen aufgerufen werden
# und benimmt sich wie ein neuer Befehl:
Write-Warning "Probieren Sie den neuen Befehl Stop-LaufendeDienste aus!"
