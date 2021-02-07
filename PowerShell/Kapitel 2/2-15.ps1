$eingabe = Read-Host -Prompt 'Geburtstag' 
Get-Date -Date $eingabe -Format '"Sie sind ein" dddd"s-Kind!"'
