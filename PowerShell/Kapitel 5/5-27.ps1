$ergebnis = Get-Service | Group-Object -Property Status -AsHashTable -AsString

# alle laufenden Dienste abrufen
$ergebnis.Running
$ergebnis['Running']  # alternative Syntax


# alle gestoppten Dienste abrufen
$ergebnis.Stopped
$ergebnis['Stopped']  # alternative Syntax
