# temporären Dateinamen herstellen:
$filename = Get-Date -Format '"report"yyyy-MM-dd-HH-mm-ss-ffff".txt"'
$path = Join-Path -Path $env:temp -ChildPath $filename

Write-Warning "Speichere in $path"

# alle installierten Hotfixe in der Datei speichern:
Get-Hotfix | Format-Table -AutoSize -Wrap | Out-File -FilePath $path -Width 100

# Datei mit assoziiertem Programm öffnen:
Invoke-Item -Path $path
