$eingabe = Read-Host -Prompt 'Geben Sie ein gültiges Datum ein'
Get-Date -Date $eingabe -Format 'yyyy-MM-dd HH:mm:ss'
