# XML-Query aus Hashtable erzeugen

# Zeitpunkt berechnen, ab dem Ereignisse ausgegeben werden sollen:
$stichtag = (Get-Date).AddHours(-24)

$hashtable = @{
  LogName = 'System'
  Level = 1,2,3          # 1=Critical, 2=Error, 3=Warning
  StartTime = $stichtag
}

# Ergebnisse verwerfen, es wird nur die Verbose-Ausgabe in der 
# Konsole benötigt
$null = Get-WinEvent -FilterHashtable $hashtable -MaxEvents 1 -Verbose
