$geburtstag = Read-Host 'Wie lautet Ihr Geburtsdatum?'
$alter = New-TimeSpan $geburtstag
$alter
$tage = $alter.Days
"Sie sind $tage Tage alt!"
