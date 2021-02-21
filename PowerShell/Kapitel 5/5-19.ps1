#requires -Version 3.0 -Modules ActiveDirectory
Search-ADAccount -AccountDisabled |
Out-GridView -Title 'Welches Konto aktivieren?' -OutputMode Multiple |
# entfernen Sie -WhatIf, wenn tatsächlich entsperrt warden soll
Enable-ADAccount -WhatIf
