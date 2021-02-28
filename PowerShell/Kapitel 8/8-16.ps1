$datum = (Read-Host -Prompt 'Datum eingeben') -as [DateTime]
if (!$datum) { $datum = Get-Date -Date '2000-01-01' }

$datum
