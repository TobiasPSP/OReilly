#requires -Version 1

# neue User-Umgebungsvariable anlegen
[Environment]::SetEnvironmentVariable('test', '123', 'User')

# Umgebungsvariable wieder löschen
[Environment]::SetEnvironmentVariable('test', $null, 'User')
