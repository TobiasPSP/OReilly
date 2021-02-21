$path = "$env:temp\beispiel.txt"
'Test mit Sonderzeichen: ÄÖÜäöüß' | Out-File -FilePath $path -Encoding ASCII
Get-Content -Path $path -Encoding UTF7
