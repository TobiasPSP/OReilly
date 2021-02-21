# Dateigröße in Kilobytes, gerundet auf eine Nachkommastelle:
Get-ChildItem -Path $env:windir -File | 
  Select-Object -Property Mode, LastWriteTime, { [Math]::Round(($_.Length/1KB),1) }, Name
