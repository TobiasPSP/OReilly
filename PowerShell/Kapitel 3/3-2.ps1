# funktioniert bei allen PowerShell-Versionen:

# auf ENTER-Taste warten:
$null = Read-Host 'EINGABETASTE drücken'

# 5 Sekunden warten lassen (reine Zeitverzögerung):
Start-Sleep -Seconds 5

# funktioniert bei allen Konsolenfenstern (nicht beim ISE-Editor!)

# auf beliebigen Tastendruck warten:
Write-Host 'Bitte beliebige Taste drücken!'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')

# funktioniert nur beim Windows-Betriebssystem:
cmd.exe /c pause  # nur bei Windows
