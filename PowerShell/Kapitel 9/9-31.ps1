# ein beliebiger Pfad:
$path = 'c:\temp\fehler.log'
# Dateierweiterung umbenennen:
$muster = '\.log$'
$kopie = $path -replace $muster,'.Kopie'
# eine Kopie könnte nun hergestellt werden,
# falls die Originaldatei tatsächlich 
# vorhanden wäre:
# Copy-Item -Path $path -Destination $kopie
# zur Kontrolle beide Informationen ausgeben:
[PSCustomObject]@{
    Path =  $path
    Kopie = $kopie
}
