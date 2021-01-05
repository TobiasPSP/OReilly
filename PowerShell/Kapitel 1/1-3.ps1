Get-Process | 
Where-Object MainWindowHandle | 
Select-Object -Property Name, Id, Description | 
Sort-Object -Property Name | 
Out-GridView -Title 'Prozesse' -OutputMode Multiple | 
Stop-Process -WhatIf
