# eigenes Objekt herstellen:
$objekt = [PSCustomObject]@{
  Name = $env:username
  Date = Get-Date
  ID = 12
}

# eigenes Objekt ausgeben:
$objekt
