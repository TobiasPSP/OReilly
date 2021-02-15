# Prozesse sortieren:
Get-Process | Sort-Object -Property Name

# Zahlenreihe absteigend sortieren:
1,2,3,2,1,2,3,4 | Sort-Object -Descending

# Lottozahlen aufsteigend sortieren:
1..49 | Get-Random -Count 7 | Sort-Object

# Dienste nach Status und dann nach Name sortieren:
Get-Service | Sort-Object -Property Status, Name
