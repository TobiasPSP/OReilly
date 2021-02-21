$errorcode = Get-Random -Maximum 10

switch ($errorcode)
{
  0            { 'OK.' }
  1            { 'Keine Holzkohle' }
  2            { 'Grillanzünder nicht vorhanden' }
  5            { 'Bratwurst not found'}
  7            { 'Gluttemperatur zu niedrig'}
  default      { "Unbekannte Fehlernummer $_" }
}
