# einen Beispieleditor öffnen
notepad

# alle Notepad-Editoren auflisten
Get-Process -Name notepad

# alle Notepad Editoren stoppen 
# (entfernen Sie -WhatIf, wenn Sie die Prozesse tatsächlich stoppen wollen)
Stop-Process -Name notepad -WhatIf
