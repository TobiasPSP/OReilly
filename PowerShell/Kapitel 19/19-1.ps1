# benötigte Bibliotheken laden:
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName PresentationFramework

# Fenster anlegen:
[System.Windows.Window]$window = [System.Windows.Window]::new()
# Fenstergröße am Inhalt ausrichten:
$window.SizeToContent = [System.Windows.SizeToContent]::WidthAndHeight
# Fensterrahmen wählen:
$window.WindowStyle = [System.Windows.WindowStyle]::ToolWindow
# Fensterrandstärke festlegen:
$window.Margin = 10
# Fenstertitel definieren:
$window.Title = 'Mitarbeiter aufnehmen'

# Textblock (Beschriftung):
[System.Windows.Controls.TextBlock]$textblock = [System.Windows.Controls.TextBlock]::new()
$textblock.Text = 'Mitarbeiter-Name'

# Eingabebox (mit Inhalt der Umgebungsvariable $env:username vordefinieren)
[System.Windows.Controls.TextBox]$textbox = [System.Windows.Controls.TextBox]::new()
$textbox.Text = $env:username

# Schaltfläche definieren:
[System.Windows.Controls.Button]$buttonOK = [System.Windows.Controls.Button]::new()
$buttonOK.Content = 'OK'
$buttonOK.Width = 80
# Rahmen im Muster links-oben-rechts-unten definieren:
$buttonOk.Margin = [System.Windows.Thickness]::new(5,5,0,5)
# festlegen, was bei einem Klick geschieht:
# (die Eigenschaft Dialogresult schließt bei einer Zuweisung das Fenster
#  und legt dessen Rückgabewert fest)
$buttonOK.add_Click({ $window.DialogResult = $true })

# zweite Schaltfläche:
[System.Windows.Controls.Button]$buttonCancel = [System.Windows.Controls.Button]::new()
$buttonCancel.Content = 'Abbruch'
$buttonCancel.Width = 80
$buttonCancel.Margin = [System.Windows.Thickness]::new(5,5,0,5)
$buttonCancel.add_Click({ $window.DialogResult = $false })

# horizontalen rechtsbündigen Stapel für die beiden Schaltflächen:
[System.Windows.Controls.StackPanel]$stackpanelButton = [System.Windows.Controls.StackPanel]::new()
$stackpanelButton.Orientation = 'Horizontal'
$stackpanelButton.HorizontalAlignment = [System.Windows.HorizontalAlignment]::Right

# Schaltflächen auf Stapel legen:
$stackpanelButton.AddChild($buttonOk)
$stackpanelButton.AddChild($buttonCancel)

# vertikalen Stapel mit Randstärke 5:
[System.Windows.Controls.StackPanel]$stackpanel = [System.Windows.Controls.StackPanel]::new()
$stackpanel.Orientation = 'Vertical'
$stackpanel.Margin = 5

# UI-ELemente auf vertikalen Stapel legen:
$stackpanel.AddChild($textblock)
$stackpanel.AddChild($textbox)
$stackpanel.AddChild($stackpanelButton)

# Fensterinhalt definieren (darf nur EIN UI-Element sein):
$window.Content = $stackpanel

# Fenster modal anzeigen (PowerShell wartet):
$result = $window.ShowDialog()

# Rückgabewert auswerten:
if ($result)
{
  $mitarbeiter = $textbox.Text
  "Gewählt: $mitarbeiter"
}
else
{
  Write-Warning "Abbruch."
}
