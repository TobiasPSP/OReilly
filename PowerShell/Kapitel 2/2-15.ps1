$path = "$env:temp\report.html"

# dieser Code wird an New-HTML weitergereicht, der damit den 
# Inhalt der HTML-Seite gestaltet:
$tabelle = { 
  
  # alle Dienste abrufen und einige Spalten auswählen:
  $daten = Get-Service | Select-Object -Property DisplayName, Status, StartType
  # Tabelle erzeugen:
  New-HTMLTable -DataTable $daten 
  
  # alle Prozesse auflisten, die ein Fenster haben:
  $daten = Get-Process | 
    Where-Object MainWindowTitle | 
    Select-Object -Property Name, Company, Description, MainWindowTitle, CPU
  # Tabelle erzeugen:
  New-HTMLTable -DataTable $daten 
  
  }

# HTML-Seite generieren und anzeigen:
New-HTML -HtmlData $tabelle -FilePath $path -ShowHTML -TitleText 'Dies und das' -Online
