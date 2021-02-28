#requires -RunAsAdmin
# ein Beispielevent auslesen:
# (passen Sie diese Angaben an, wenn Sie andere Ereignis-Ids untersuchen wollen)
$EventId = 4634
$LogName = 'Security'

$beispiel = Get-WinEvent -FilterHashtable @{
  LogName = $LogName
  Id = $EventId
} -MaxEvents 1

# Inhalt dieses Beispielevents testen:

# Anzahl der Eigenschaften bestimmen:
# eins abziehen, weil Indizes bei 0 und nicht bei 1 
# beginnen:
$anzahl = $beispiel.Properties.Count - 1

# Alle Informationen beispielhaft ausgeben:
0..$anzahl | ForEach-Object {
  '$_.Properties[{0}].Value = {1}' -f $_, $beispiel.Properties[$_].Value  
}
