$text = 'Mar 18, 2016	Server_07786	success'
$muster = 'Server_\d{5}'

if ($text -match $muster)
{
  $Matches[0]
}
