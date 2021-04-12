$xaml = @'
<Window
   xmlns=http://schemas.microsoft.com/winfx/2006/xaml/presentation
   xmlns:x=http://schemas.microsoft.com/winfx/2006/xaml
   SizeToContent="WidthAndHeight"
   Title="Mitarbeiter aufnehmen"
   WindowStyle="ToolWindow"
   Margin="10"
   >
   <StackPanel Orientation="Vertical" Margin="5">
     <TextBlock>Mitarbeiter-Name</TextBlock>
     <TextBox Name="textbox"></TextBox>
     <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
        <Button Name="buttonOk" MinWidth="80" Margin="5,5,0,5">OK</Button>
        <Button Name="buttonCancel" MinWidth="80" Margin="5,5,0,5">Abbruch</Button>
      </StackPanel>
   </StackPanel>
</Window>
'@

#region Hilfsfunktionen
function Convert-XamltoWindow
{
  param
  (
    [Parameter(Mandatory=$true)]
    [string]
    $XAML
  )
  
  Add-Type -AssemblyName PresentationFramework
  
  $reader = [XML.XMLReader]::Create([IO.StringReader]$XAML)
  $result = [Windows.Markup.XAMLReader]::Load($reader)
  $reader.Close()
  $reader = [XML.XMLReader]::Create([IO.StringReader]$XAML)
  while ($reader.Read())
  {
      $name=$reader.GetAttribute('Name')
      if (!$name) { $name=$reader.GetAttribute('x:Name') }
      if($name)
      {$result | 
         Add-Member NoteProperty -Name $name -Value $result.FindName($name) Force}
  }
  $reader.Close()
  $result
}

function Show-WPFWindow
{
  param
  (
    [Parameter(Mandatory=$true)]
    [Windows.Window]
    $Window
  )
  
  $result = $null
  $null = $window.Dispatcher.InvokeAsync{
    $result = $window.ShowDialog()
    Set-Variable -Name result -Value $result -Scope 1
  }.Wait()
  $result
}
#endregion Hilfsfunktionen

# XAML in Fensterobjekt verwandeln:
$window = Convert-XamltoWindow -XAML $xaml 

# GUI-Elemente des Fensters warden nun immer über das Fenster
# selbst ($window) und dann dem zugewiesenen Namen des GUI-Elements
# angesprochen, nicht über separate Variablen

# nachträgliche Anpassungen an den GUI-Elementen

# Vorgewählten Text im Eingabefeld:
$window.textbox.Text = $env:username

# Eventhandler definieren
$window.buttonOK.add_Click({ $window.DialogResult = $true })
$window.buttonCancel.add_Click({ $window.DialogResult = $false })
$window.textbox.add_TextChanged(
  { 
    $window.buttonOK.IsEnabled = $window.textbox.Text.Trim().Length -gt 0 
  })

# Fenster anzeigen:
$result = Show-WPFWindow -Window $window

# Rückgabewert auswerten:
if ($result)
{
  $mitarbeiter = $window.textbox.Text
  "Gewählt: $mitarbeiter"
}
else
{
  Write-Warning "Abbruch."
}
