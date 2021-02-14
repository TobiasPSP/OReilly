# auszuführenden Code in geschwungenen Klammern definieren
# ersetzen Sie den Code durch beliebigen anderen PowerShell-Code,
# wenn Sie mögen. Die maximale Länge darf 2000 Zeichen nicht 
# überschreiten:
$code = {
  Get-Service | 
  Where-Object CanStop | 
  Out-GridView -Title "Welchen Dienst stoppen?" -PassThru |
  Stop-Service -whatIf
}

# Methoden des Betriebssystems wandeln den Code zuerst in Bytes um...
$bytes = [System.Text.Encoding]::Unicode.GetBytes($code)
# ...danach werden diese Bytes in einen Base64-String verwandelt:
$encoded = [Convert]::ToBase64String($bytes)

# daraus wird der Befehl konstruiert:

# zuerst PowerShell-Art feststellen:
if ($PSVersionTable.Edition -eq 'Core')
{
  $ps = 'pwsh'
}
else
{
  $ps = 'powershell'
}
# dann Befehlszeile zusammenstellen:
"$ps -noprofile -EncodedCommand $encoded" | Set-ClipBoard

Write-Warning 'Befehlszeile liegt in der Zwischenablage.'
