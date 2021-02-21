$info = @{
  0 = 'OK.'
  1 = 'Keine Holzkohle' 
  2 = 'Grillanzünder nicht vorhanden' 
  5 = 'Bratwurst not found'
  7 = 'Gluttemperatur zu niedrig'
 }

$errorcode = Get-Random -Maximum 10
if ($info.ContainsKey($errorcode) -eq $false)
{
  "Unbekannter Fehler $errorcode"
}
else
{
  $info[$errorcode]
}
