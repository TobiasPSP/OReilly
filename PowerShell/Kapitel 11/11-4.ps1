# setzt ein deutsches Betriebssystem voraus:
$datum = '24. Dezember 2021' -as [DateTime]

$datum.Day
$datum.Month
$gestern = $datum.AddDays(-1)
$gestern
