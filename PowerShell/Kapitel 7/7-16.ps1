#requires -Modules EncodingAnalyzer

# verschiedene Test-Textdateien sollen geschrieben werden:
$p1 = "$env:temp\out-file.txt"
$p2 = "$env:temp\set-content.txt"
$p3 = "$env:temp\redirection.txt"
$p4 = "$env:temp\out-file default.txt"
$p5 = "$env:temp\set-content default.txt"

# dazu werden unterschiedliche Befehle eingesetzt:
'Hallo ÄÖÜ' | Out-File -FilePath $p1
'Hallo ÄÖÜ' | Set-Content -Path $p2
'Hallo ÄÖÜ' > $p3
'Hallo ÄÖÜ' | Out-File -FilePath $p4 -Encoding Default
'Hallo ÄÖÜ' | Set-Content -Path $p5 -Encoding Default

# das Ergebnis wird mit Get-Encoding überprüft:
$p1, $p2, $p3, $p4, $p5 | Get-Encoding
