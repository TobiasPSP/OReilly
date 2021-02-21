$datum = Get-Date
$stunde = $datum.Hour

$vormittag =  $stunde -gt 6 -and $stunde -lt 12
$mittag = $stunde -ge 12 -and $stunde -le 13
$nachmittag = $stunde -gt 13 -and $stunde -lt 18
$abend = $stunde -ge 18

if ($vormittag)
{
  'Guten Morgen!'
}
elseif ($mittag)
{
  'Guten Hunger!'
}
elseif ($nachmittag)
{
  'Bald ist Feierabend ...!'
}
elseif ($abend)
{
  'Bis morgen!'
}
else
{
  'Es herrscht Nacht ...'
}
