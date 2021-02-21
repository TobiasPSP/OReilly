$ziel = 'C:\Fotos'
$index = 0

# alle Dateien aus dem Zielordner auflisten und umbenennen:
Get-ChildItem -Path $ziel -File |
  Rename-Item -NewName {
    # dieser Skriptblock wird für jede umzubenennende Datei aufgerufen
    # die jeweilige Originaldatei liegt in $_
    # die Aufgabe des Skriptblocks ist es, den neuen Namen zu berechnen

    # ein Index wird um eins hochgezählt:
    $script:index++

    # der neue Name wird mit dem Operator -f und einer Textschablone generiert:
    # zuerst ein Datum im Format Jahr-Monat-Tag Stunde-Minute-Sekunde
    # dann "Pic", gefolgt von einem vierstelligen Index
    # dann die Dateiextension der Originaldatei
    '{0:yyyy-MM-dd HH-mm-ss} Pic{1:d4}{2}' -f $_.CreationTime, $index, $_.Extension
  }

# Zielordner öffnen
explorer $ziel
