$ergebnis = Get-Service | Group-Object -Property Status -AsHashTable 

# alle laufenden Dienste abrufen (funktioniert nicht)
$ergebnis.Running
