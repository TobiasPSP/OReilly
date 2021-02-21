$lottozahlen = 1..49 | Get-Random -Count 6 | Sort-Object
$text =  $lottozahlen -join '] [' 
"[$text]"
