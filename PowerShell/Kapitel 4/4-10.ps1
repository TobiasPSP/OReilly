# nicht gut: Dienste sortieren, ohne mit -Property anzugeben, welche Eigenschaft
# sortiert werden soll:
Get-Service | Sort-Object

# tatsächlich wird nun die Textrepräsentation der Objekte sortiert:
Get-Service | ForEach-Object { $_.ToString() }
