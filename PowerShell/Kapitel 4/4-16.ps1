# Beispiel-Hashtable:
$hashtable = @{
  Name = 'Weltner'
  Date = Get-Date
  Username = $env:username
  Role = 'Author'
}

# $hashtable enthält eine Liste mit Schlüssel-Wert-Paaren
$hashtable

# funktioniert nicht:
$hashtable | Sort-Object -Property Name

# funktioniert:
# nach Hashtable-Schlüssel sortieren:
$hashtable.GetEnumerator() | Sort-Object -Property Name
# nach Hashtable-Werten sortieren:
$hashtable.GetEnumerator() | Sort-Object -Property Value
