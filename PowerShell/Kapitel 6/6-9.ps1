# leeres Hashtable anlegen:
$hashtable = @{}


# Informationen aus verschiedenen Quellen im Hashtable sammeln:
$hashtable.Benutzer = $env:username
$hashtable.Datum = Get-Date
$hashtable.ComputerName = $env:COMPUTERNAME
$hashtable.Dienste = Get-Service

# Hashtable in ein Objekt umwandeln:
$objekt = [PSCustomObject]$hashtable

$objekt
$objekt | Out-GridView
