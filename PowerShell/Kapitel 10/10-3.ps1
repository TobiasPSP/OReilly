# auf Microsoft Excel warten:
Wait-Process -Name excel -Timeout 10 -ErrorAction SilentlyContinue -ErrorVariable err

# Fehlermeldung auswerten:
if ($err.FullyQualifiedErrorId -eq 'ProcessNotTerminated,Microsoft.PowerShell.Commands.WaitProcessCommand')
{
  'Excel läuft immer noch.'
}
elseif ($err.FullyQualifiedErrorId -eq 'NoProcessFoundForGivenName,Microsoft.PowerShell.Commands.WaitProcessCommand')
{
  'Excel lief gar nicht.'
}
else
{
  'Excel wurde beendet.'
}
