# ein beliebiger Pfad zu einer Datei:
$path = 'c:\temp\fehler.log'
# Dateierweiterung umbenennen:
$kopie = $path.Replace('.log','.Kopie')

# eine Kopie könnte nun hergestellt werden,
# falls die Originaldatei tatsächlich 
# vorhanden wäre:
# Copy-Item -Path $path -Destination $kopie

# zur Kontrolle beide Informationen ausgeben:
[PSCustomObject]@{
    Path =  $path
    Kopie = $kopie
}
