# Datei im temporären Ordner unter diesem Namen ablegen:
$path = "$env:temp\testfile.txt"
# Text in die Datei schreiben:
"Hello World!" | Out-File -FilePath $path
# mehr Text anhängen:
Get-Date | Out-File -FilePath $path -Append
# Dateiinhalt in einem Editor öffnen
notepad $path
