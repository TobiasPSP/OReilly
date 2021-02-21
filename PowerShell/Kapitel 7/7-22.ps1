$originale = 'C:\LogFiles'

# alle log-Dateien aus dem Ordner $originale als Sicherheitskopie
# mit Endung .bak in denselben Ordner legen:
Get-ChildItem -Path $originale -Filter *.log |
  Copy-Item -Destination { 
         # der Skriptblock berechnet den Zielnamen
         # $_ repräsentiert jeweils eine zu kopierende Originaldatei
         # mit all ihren Eigenschaften

         # der Dateiname der Originaldatei findet sich in "Name":
	  $name = $_.Name
         # der neue Dateiname soll die Extension ".bak" tragen:
	  $neuerName = $name + '.bak'
         # der absolute Pfadname der Originaldatei liegt in "FullName"
         # Split-Path berechnet daraus den Ordner, in dem die Originaldatei liegt:
         $ordner = Split-Path $_.FullName
         # Join-Path berechnet daraus den neuen absoluten Pfadnamen
         # Ergebnis wird weder an Variable zugewiesen noch an Pipeline weitergegeben
         # und somit zum Rückgabewert (Türchen 3 im Türchen-Modell Kapitel 2):
	  Join-Path -Path $ordner -ChildPath $neuerName
	}

# Ordnerinhalt auflisten:
Get-ChildItem -Path $originale
