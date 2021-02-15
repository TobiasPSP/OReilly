Get-WinEvent -LogName 'Microsoft-Windows-Ntfs/Operational' -MaxEvents 10 |
# einige Spalten auswählen:
Select-Object -Property TimeCreated, Id, Name, UserId, Message |
# Zeilenumbruch in Eigenschaft "Message" entfernen, weil Excel keine
# mehrzeiligen Texte anzeigt:
ForEach-Object {
  $_.Message = $_.Message -replace '\n',' ' -replace '\r'
  $_
} |
# in Excel-Datei exportieren und Excel öffnen:
Export-Excel
