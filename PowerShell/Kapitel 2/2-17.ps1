$path = "$env:temp\report.html"

# Prozesse mit eigenem Fenster auswählen:
$Processes = Get-Process | 
  Where-Object MainWindowTitle | 
  Select-Object -Property ProcessName, Id, Company, Description, MainWindowTitle


New-HTML -TitleText 'Prozess-Diagramm' -Online -FilePath $path -ShowHTML -HtmlData {
    New-HTMLSection -Invisible -Content {
        # Seite in zwei Spalten unterteilen
        
        # erste Spalte: die Tabelle mit den Prozessen:    
        New-HTMLPanel -Content {
            New-HTMLTable -DataTable $Processes -DataTableID 'Table1'
        }
        # zweite Spalte: ein Diagramm mit den Abhängigkeiten:
        New-HTMLPanel -Content {
            New-HTMLDiagram -Height '1000px' {
                $label = "Prozesse auf`r`n$env:computername"
                New-DiagramEvent -ID 'Table1' -ColumnID 1
                # in die Mitte ein Windows-Icon in "AirForceBlue" legen:
                New-DiagramNode -Label $label -IconBrands windows -IconColor AirForceBlue
                
                # alle Prozesse mit Pfeilen mit diesem Symbol verbinden:
                $Processes | Foreach-Object {
                    $childLabel = $_.ProcessName + " (Pid " + $_.Id + ")"
                    New-DiagramNode -Label $childLabel -Id $_.Id -To $label -ArrowsFromEnabled -Shape box -LinkColor Apricot
                }
            }
        }
    }
}
