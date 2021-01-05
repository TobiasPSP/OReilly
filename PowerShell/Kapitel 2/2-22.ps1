# URL der MIDI-Datei für den "Imperial March"
# Achtung: Internetadressen veralten schnell. Wenn dieser Download nicht mehr
# zur Verfügung steht, googeln Sie wie angegeben selbst und verwenden die
# Internetadresse einer anderen MIDI-Datei
$url = 'http://www.midis101.com/midi_download/8424/7629E74E55697C4C30B408F80B9077EF/Star_Wars___Imperial_March'
$filename = Join-Path -Path $PSScriptRoot -ChildPath 'imperialmarch.mid'

# Datei herunterladen:
Invoke-RestMethod -UseBasicParsing -Uri $url -OutFile $filename

# heruntergeladene Datei anzeigen:
Get-Item -Path $filename
