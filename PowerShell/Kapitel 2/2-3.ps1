# neuen Ordner anlegen (Fehler ignorieren):
New-Item -Path 'c:\report' -ItemType Directory -ErrorAction Ignore

# Batterie-Report der letzten 14 Tage generieren 
# und als HTML speichern:
powercfg /batteryreport /duration 14 /output c:\report\report.html 

# Generierten Report mit Browser öffnen:
Invoke-Item -Path 'c:\report\report.html'
