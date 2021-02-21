$text = 'Server77625.'
$muster = '\d{5}'
$ergebnis = $text -match $muster ? $Matches[0] : 'N/A'

"Server-Nummer: $ergebnis"
