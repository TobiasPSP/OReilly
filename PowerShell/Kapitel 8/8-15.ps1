# zuverlässiger Ping-Ersatz
# funktioniert in PowerShell und WindowsPowerShell:

# Die Argumente: Ziel des Pings und sein Timeout in Millisekunden:
$ComputerName = 'powershell.one'
$Timeout = 2000

$pinger = [System.Net.NetworkInformation.Ping]::new()
$ergebnis = $pinger.Send($ComputerName, $Timeout)

# die relevanten Ergebnisse zurückliefern
$ergebnis | Select-Object -Property Address, Status, RoundTripTime
