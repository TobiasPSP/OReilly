$path = "$env:temp\report.html"

$inhalt = {
  # alle Dienste abrufen...
  $services = Get-Service | 
    # und nützliche Eigenschaften anzeigen:
    Select-Object -Property Name, DisplayName, Status, StartType
    
  # eine neue Tabelle mit diesen Diensten generieren (100 pro Seite):
  New-HTMLTable -DataTable $services -HideFooter -PagingLength 100 -Html {

    # einige Zellen der Tabelle automatisch abhängig vom Zelleninhalt farbig hervorheben

    # alle Zeilen, in denen in der Spalte "Status" der Text "Stopped" steht, 
    #weiss auf rotem Hintergrund hervorheben
    New-TableCondition -Name 'Status' -ComparisonType string -Operator eq -Value 'Stopped' -Color White -BackgroundColor Crimson -Row
    # alle Zeilen, in denen in der Spalte "StartType" der Text "Disabled" steht, 
    # mit oranger Schrift hervorheben
    New-TableCondition -Name 'StartType' -ComparisonType string -Operator eq -Value 'Disabled' -Color Orange

  }
}

# Tabelle generieren und anzeigen:
New-HTML -Name 'Dienste-Übersicht' -FilePath $path -Show -HtmlData $inhalt
