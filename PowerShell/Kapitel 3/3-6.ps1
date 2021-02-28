#requires -RunAsAdmin
# benötigt Admin-Rechte, um das Security-Ereignislogbuch von Windows zu lesen

# Klartext-Auflistung der Logontypen:
enum LogonType {
  None = 0
  Password = 1
  Interactive = 2
  Network = 3
  Batch = 4
  Service = 5
  Unlock = 7
  NetworkClearText = 8
  NewCredentials = 9
  RemoteInteractive = 10
  CachedInteractive = 11
}

# Ereignisse mit ID 4624 (Anmeldung) aus dem Security-Logbuch:
Get-WinEvent -FilterHashtable @{
  LogName = 'Security'
  Id = 4624
} | 
# empfangene Objekte weiter aufbereiten:
ForEach-Object {
  # im Array-Element 5 (mit Index 4) steht die SID des
  # Users. Anmeldungen von "LocalSystem" mit SID 
  # 'S-1-5-18' ignorieren:
  if ($_.Properties[4].Value -ne 'S-1-5-18')
  {
    # nützliche Informationen aus dem Ereignis in einem eigenen
    # Objekt zusammenfassen:
    [PSCustomObject]@{
      Time = $_.TimeCreated
      Type = 'LogonSuccess'
      User = '{0}\{1}' -f $_.Properties[6].Value, $_.Properties[5].Value
      LogonType = $_.Properties[8].Value -as [LogonType]
      Sid  = $_.Properties[4].Value
    }
  }
} | 
# Ergebnisse in einem GridView anzeigen:
Out-GridView
