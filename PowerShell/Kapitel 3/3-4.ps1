[Flags()]
enum Topping {
  Nichts = 0
  Käse = 1
  Tomatensauce = 2
  Schinken = 4
  Salami = 8
  Pepperoni = 16
  Zwiebeln = 32
}

# Klartextnamen repräsentieren eigentlich Bits:
[Topping]$Belag = 'Käse','Salami','Zwiebeln'

# gespeichert werden alle Bits in einer speicherplatzschonenden einzelnen Zahl:
[int]$Belag

# diese Zahl kann jederzeit in die Klartextnamen umgewandelt werden:
[Topping]41

# neuen Belag hinzufügen:
$Belag += 'Pepperoni'
$Belag

# der Zahlenwert wird automatisch umberechnet:
[int]$Belag

# Belag entfernen:
$Belag -= 'Zwiebeln'
$Belag

# der Zahlenwert wird automatisch umberechnet:
[int]$Belag

# tatsächlich wird jeder Belag intern als Bit (1 oder 0) 
# in einer Bitmaske repräsentiert:
[Convert]::ToString([int]$Belag, 2)

# prüfen, ob Liste einen bestimmten Wert enthält, z.B. "Käse":
($belag -band 'Käse').Count -gt 0
