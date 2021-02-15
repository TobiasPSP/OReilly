# -WhatIf sorgt jeweils dafür, dass nur simuliert wird. Entfernen Sie -WhatIf, dann
# nehmen die Cmdlets tatsächlich Änderungen vor

# Laufende Dienste stoppen
Get-Service | Where-Object CanStop | Out-GridView -PassThru | Stop-Service -WhatIf

# Laufende Prozesse stoppen
Get-Process | Where-Object MainWindowTitle | Out-GridView -PassThru | Stop-Process -WhatIf

# Benutzerkonten entsperren
Search-ADAccount -AccountDisabled | Out-GridView -PassThru | Enable-ADAccount -WhatIf
