Get-Service |
Where-Object CanStop |
Out-GridView -Title 'Welche Dienste neu starten?' -OutputMode Multiple |
Restart-Service -WhatIf
