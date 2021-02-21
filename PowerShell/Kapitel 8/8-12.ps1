$datum = Read-Host -Prompt 'Datum eingeben'

# falls das eingegebene Datum kein gültiges Datum ist,
# stattdessen den 1.1.2000 verwenden:
$datum = ($datum -as [DateTime]) ?? (Get-Date -Date '2000-01-01')

$datum
