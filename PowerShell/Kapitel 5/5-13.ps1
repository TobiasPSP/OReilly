# Dateigröße in Bytes:
Get-ChildItem -Path $env:windir -File | 
  Select-Object -Property Mode, LastWriteTime, Length, Name
