$text = 'Server77625.'
$muster = '\d{5}'

$ergebnis = if ($text -match $muster) 
{ 
  # gefundene Zahl zurückgeben:
  $Matches[0] 
} else { 
  # wenn die Zahl nicht gefunden wird, 
  # "N/A" zurückgeben:
  'N/A'
}

"Server-Nummer: $ergebnis"
