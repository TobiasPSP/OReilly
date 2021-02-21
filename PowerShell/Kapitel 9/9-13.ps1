$lottozahlen = 1..49 | Get-Random -Count 6 | Sort-Object
$lottozahlenText = $lottozahlen -join ', '
$text = "Die Lottozahlen lauten: $lottozahlenText"
$text
