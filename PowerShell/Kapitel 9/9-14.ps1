# geheime variable legt automatisches Trennzeichen fest
# ofs = output field separator
$ofs = ', '

$lottozahlen = 1..49 | Get-Random -Count 6 | Sort-Object
$text = "Die Lottozahlen lauten: $lottozahlen"
$text
