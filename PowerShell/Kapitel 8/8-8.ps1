$datum = Get-Date
$stunde = $datum.Hour

if ($stunde -gt 6 -and $stunde -lt 12)
{
  'Guten Morgen!'
}
elseif ($stunde -ge 12 -and $stunde -le 13)
{
  'Guten Hunger!'
}
elseif ($stunde -gt 13 -and $stunde -lt 18)
{
  'Bald ist Feierabend ...!'
}
elseif ($stunde -ge 18)
{
  'Bis morgen!'
}
else
{
  'Es herrscht Nacht ...'
}
