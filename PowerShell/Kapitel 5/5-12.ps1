Get-Process | 
  Select-Object -Property ProcessName, Id | 
  Out-GridView -Title 'Prozess-ID Zuordnung'

Get-Process | 
  Select-Object -Property Name, Company, Description | 
  Out-GridView -Title 'Hersteller-Liste'

Get-Process | 
  Select-Object -Property Name, StartTime, CPU | 
  Out-GridView -Title 'Ressourcen-Ansicht'

Get-Process | 
  Select-Object -Property Name, *Time* | 
  Out-GridView -Title 'Zeitenübersicht'

Get-Process |
  Select-Object -Property * |
  Out-GridView -Title 'Alle Eigenschaften (max 30)'
