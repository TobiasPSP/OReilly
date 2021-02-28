#requires -RunAsAdmin
# benötigt Admin-Rechte, um das Security-Ereignislogbuch von Windows zu lesen

# Ereignisse mit ID 4634 (Abmeldung) aus dem Security-Logbuch:
Get-WinEvent -FilterHashtable @{
  LogName = 'Security'
  Id = 4634
} | 
# empfangene Objekte weiter aufbereiten:
ForEach-Object {
  if ($_.Properties[0].Value -ne 'S-1-5-18')
  {
    # nützliche Informationen aus dem Ereignis in einem eigenen
    # Objekt zusammenfassen:
    [PSCustomObject]@{
      Time = $_.TimeCreated
      Type = 'LogoffSuccess'
      User = '{0}\{1}' -f $_.Properties[2].Value, $_.Properties[1].Value
      Sid  = $_.Properties[0].Value
    }
  }
} | 
# Ergebnisse in einem GridView anzeigen:
Out-GridView
