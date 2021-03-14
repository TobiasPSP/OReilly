"testinhalt" | Out-File -FilePath $env:temp\testdatei.txt
$datei = Get-Item -Path $env:temp\testdatei.txt
