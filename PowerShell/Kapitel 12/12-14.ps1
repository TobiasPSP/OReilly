# eigenen Typ definieren:
class MeineDreiInfos
{
  [string]$Name
  [datetime]$Date
  [int]$Id
}

# neues Objekt beschaffen:
$objekt = [MeineDreiInfos]::new()

# Informationen im Objekt speichern:
$objekt.Name = $env:username
$objekt.Date = Get-Date
$objekt.Id = 12

# eigenes Objekt ausgeben:
$objekt
