$datum = Get-Date
$stunde = $datum.Hour

Switch ($stunde)
{
  { $_ -gt 6 -and $_ -lt 12 }  { 'Guten Morgen!' }
  { $_ -ge 12 -and $_ -le 13 } { 'Guten Hunger!' }
  { $_ -gt 13 -and $_ -lt 18 } { 'Bald ist Feierabend ...!' }
  { $_ -ge 18 }                { 'Bis morgen!' }
  default                      { 'Es herrscht Nacht ...' }
}
