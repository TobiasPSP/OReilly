Get-Process | 
  Where-Object MainWindowHandle -gt 0 | 
  Select-Object -Property Name, Id, MainWindowTitle | 
  Out-GridView -Title 'Wählen Sie Prozesse aus, die beendet werden' -PassThru | 
  Stop-Process -WhatIf
