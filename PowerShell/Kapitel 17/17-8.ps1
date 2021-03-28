try
{
  # der folgende Computer muss via Netzwerk erreichbar sein
  # (ggf. Namen anpassen)
  $Computer = 'testcomputer'
  Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computer -Credential Unbekannt
}
catch
{
  "Fehler aufgetreten: $_"
}
