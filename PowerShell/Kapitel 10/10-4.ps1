#requires -Version 1

# Priorität verringern
$prozess = Get-Process -id $pid
$prozess.PriorityClass = 'BelowNormal'

$liste = Get-ChildItem -Path $env:windir -Filter *.log -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Fullname

# Priorität wiederherstellen
$prozess.PriorityClass = 'Normal'
