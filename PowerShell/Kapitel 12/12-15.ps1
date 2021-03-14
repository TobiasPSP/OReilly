$objekt = [PSObject]::new() | Add-Member -MemberType NoteProperty -Name Name -Value $env:username -PassThru
$objekt | Add-Member -MemberType NoteProperty -Name Datum -Value (Get-Date)
$objekt | Add-Member -MemberType NoteProperty -Name Id -Value 12

$objekt
