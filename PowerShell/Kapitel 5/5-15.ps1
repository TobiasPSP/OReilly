$lengthKB = @{ 
  Name = 'Length(KB)'
  Expression = { [Math]::Round(($_.Length/1KB),1) }
}

# Dateigröße in Kilobytes, gerundet auf eine Nachkommastelle:
Get-ChildItem -Path $env:windir -File | 
  Select-Object -Property Mode, LastWriteTime, $LengthKB, Name
