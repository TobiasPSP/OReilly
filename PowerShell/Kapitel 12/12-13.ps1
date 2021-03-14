# geordnetes Hashtable erzeugen:
$hashtable = [Ordered]@{
  Name = $env:username
  Date = Get-Date
}

# Informationen können jederzeit hinzugefügt werden:
$hashtable.ID = 12
$hashtable.Sonstiges = 'test'

# am Ende das Hashtable in Objekt umwandeln:
$objekt = [PSCustomObject]$hashtable

# eigenes Objekt ausgeben:
$objekt
