# Speicherort für heruntergeladene MIDI-Datei:
$MidiFile = Join-Path -Path $env:temp -ChildPath 'imperialmarch.mid'

# Dateiname der PDF-Datei, die generiert werden soll:
$PdfFile = Join-Path -Path $env:temp -ChildPath 'imperialmarch.pdf'

# Notenblätter als MIDI-Datei herunterladen:
Invoke-RestMethod -UseBasicParsing -Uri $url -OutFile $MidiFile

# Pfadname von MuseScore (muss installiert sein)
# ACHTUNG: PASSEN SIE DIESEN PFAD WIE IM KAPITEL BESCHRIEBEN AN!
# ER MUSS AUF IHRE KONKRETE MUSESCORE-ANWEISUNG WEISEN!
$muse = 'C:\Program Files\MuseScore 3\bin\MuseScore3.exe'
$exists = Test-Path -Path $muse
if ($exists -eq $false)
{
  # wenn Sie MuseScore über scoop installiert haben, ist dieser Pfad richtig:
  $muse = "$home\Scoop\Apps\musescore\current\bin\musescore.exe"
  $exists = Test-Path -Path $muse
  if ($exists -eq $false)
  {
    throw 'MuseScore nicht gefunden. Kontrollieren Sie den Pfad! '
  }
}

# MuseScore aufrufen, Argumente übergeben und auf Abschluss warten:
# (ACHTUNG: MuseScore-Parameter sind case-sensitive, unterscheiden also
#  zwischen Groß- und Kleinschreibung! Der richtige Parameter lautet -o
#  wie in "Otto" und muss kleingeschrieben sein!)
Start-Process -Wait -FilePath $muse -ArgumentList '-o', $PdfFile, $MidiFile

# PDF-Datei öffnen (PDF-Viewer nötig)
Invoke-Item -Path $PdfFile
