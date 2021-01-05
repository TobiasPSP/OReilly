# Achtung: es wird vorausgesetzt, dass sich dieses Skript in demselben Ordner
# befindet wie die MIDI-Datei, die Sie nach PDF konvertieren wollen,
# und dass diese Datei "imperialmarch.mid" heisst. 
# Sie müssen dieses Skript also unbedingt
# zuerst speichern und dann als Skript ausführen.
# Nur dann enthält $PSScriptRoot den Ordnernamen, in dem sich dieses
# Skript befindet. Andernfalls ist die Variable leer.
$filename = Join-Path -Path $PSScriptRoot -ChildPath 'imperialmarch.mid'

# Dateiname der PDF-Datei, die generiert werden soll:
$outfile = Join-Path -Path $PSScriptRoot -ChildPath 'imperialmarch.pdf'

# Pfadname von MuseScore (muss installiert sein)
$muse = 'C:\Program Files\MuseScore 3\bin\MuseScore3.exe'

# MuseScore aufrufen und Argumente übergeben
Start-Process -FilePath $muse -ArgumentList '-o', $outfile, $filename -Wait

# Alternativer Aufruf ohne Start-Process:
# & $muse -o $outfile $filename 

# PDF-Datei öffnen (PDF-Viewer nötig)
Invoke-Item -Path $outfile
