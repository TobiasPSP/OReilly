# Datum liegt in einer französischen Schreibweise vor:
$datumFranzoesisch = 'vendredi 23 novembre 2012 11:19:13'

# für die Umwandlungen die Quell- und Zielkultur besorgen:
[System.Globalization.CultureInfo]$Frankreich = 'fr-FR'
[System.Globalization.CultureInfo]$Taiwan = 'zh-TW'

# Datumstext unter Angabe seiner Kultur in einen DateTime-Typ verwandeln
# dieser ist sprachunabhängig:
$DateTime = [datetime]::Parse($datumFranzoesisch, $Frankreich)

# von hier aus in Zielkultur umwandeln
# das Ergebnis ist jetzt wieder Text (String):
$datumTaiwan = $DateTime.ToString($Taiwan)

''
"$datumFranzoesisch -> $datumTaiwan"
