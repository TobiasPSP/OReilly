$ProzessObjekt = Start-Process -FilePath notepad -PassThru
$ergebnis = $ProzessObjekt.WaitForExit(3000)
if ($ergebnis)
{
  'Prozess wurde innerhalb von 3 Sekunden beendet und läuft nicht mehr.'
}
else
{
  'Prozess wurde in den letzten 3 Sekunden nicht beendet und läuft noch.'
}
