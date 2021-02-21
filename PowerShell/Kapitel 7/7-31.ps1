# die Größe dieses Ordners soll ermittelt werden
$Path = 'c:\windows'

# es sollen alle Dateien berücksichtigt werden
# (ersetzen Sie dies z. B. durch '*.log', um nur solche
# Dateien zu zählen)
$Filter = '*'

$TotalSize = Get-ChildItem -Path $Path -Filter $Filter -File -ErrorAction SilentlyContinue -Recurse -Force | Measure-Object -Property Length -Sum |  Select-Object -ExpandProperty Sum

"Die Gesamtgröße des Ordners $Path beträgt $TotalSize Bytes."

$TotalSizeMB = $TotalSize / 1MB

'Die Gesamtgröße des Ordners "{0}" beträgt {1:n1} MB.' -f $Path, $TotalSizeMB
