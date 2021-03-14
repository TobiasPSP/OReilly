# erste Eingabeaufforderung:
$nachricht = 'Geburtstag eingeben'

do {
    $eingabe = (Read-Host -Prompt $nachricht) -as [DateTime]
    # falls die Schleife wiederholt wird, diese Meldung ausgeben:
    $nachricht = 'Das war kein Datum. Nochmal'
# Schleife wiederholen, wenn $eingabe den Wert $null enthält
# weil die Benutzereingabe nicht in ein Datum umgewandelt werden konnte:
} until ($eingabe -ne $null)

# Datumsinformation ausgeben. Der Operator -f füllt die Informationen
# an den Platzhalterstellen in den Text ein. Die Zeichen nach dem Doppelpunkt
# bestimmen, welche Datumsinformationen Sie ausgeben wollen und unterscheiden
# zwischen Groß- und Kleinschreibung. 
'Das Datum "{0:dd.MM.yyyy}" fällt auf einen {0:dddd}.' -f $eingabe
