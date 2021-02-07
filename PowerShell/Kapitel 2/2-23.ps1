# Pfadname zur vorher heruntergeladenen MIDI-Datei:
$filename = Join-Path -Path $env:temp -ChildPath 'imperialmarch.mid'

# MIDI-Befehle nachladen
Add-Type -AssemblyName PresentationCore

# neuen Mediaplayer beschaffen:
$player = [System.Windows.Media.MediaPlayer]::new()

# MIDI-Datei öffnen, abspielen und schließen:
$player.Open($filename)

# MIDI-Datei wird asynchron im Hintergrund abgespielt
# PowerShell läuft weiter. Sie könnten also MIDI-Dateien
# im Hintergrund abspielen, während Ihr PowerShell-Skript
# andere Aufgaben bearbeitet.
$player.Play()

# in diesem Fall hat PowerShell nichts weiter zu tun und
# wartet also, bis der Anwender mit ENTER genug gehört hat:
$null = Read-Host -Prompt 'Drücken Sie ENTER, um zu beenden'

$player.Stop()

# Wichtig: nur wenn der MIDI-Synthesizer geschlossen wird, können andere
# Programme wieder MIDI-Daten abspielen. Solange MIDI von einem
# Programm genutzt wird, ist die MIDI-Ausgabe anderer Programme
# nicht zu hören:
$player.Close()
