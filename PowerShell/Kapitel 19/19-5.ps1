$xaml = @'
<Window
   xmlns=http://schemas.microsoft.com/winfx/2006/xaml/presentation
   xmlns:x=http://schemas.microsoft.com/winfx/2006/xaml
   MinWidth="200"
   
   SizeToContent="WidthAndHeight"
   Title="Service Stopper"
   Topmost="True">
   <Grid Margin="10,10,10,10">
      <Grid.ColumnDefinitions>
         <ColumnDefinition Width="Auto"/>
         <ColumnDefinition Width="*"/>
      </Grid.ColumnDefinitions>
      <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
      </Grid.RowDefinitions>

      <TextBlock Grid.Column="1" Margin="10">Welcher Dienst soll gestoppt werden?</TextBlock>
      <TextBlock Grid.Column="0" Grid.Row="1" Margin="5">Service</TextBlock>
      
      <ComboBox Name="ComboService" Grid.Column="1" Grid.Row="1" Margin="5"></ComboBox>
      
      <StackPanel Orientation="Horizontal" HorizontalAlignment="Right"
VerticalAlignment="Bottom" 
       Margin="0,10,0,0" Grid.Row="2" Grid.ColumnSpan="2">
        <Button Name="ButOk" MinWidth="80" Margin="5">Stoppen</Button>
        <Button Name="ButCancel" MinWidth="80" Margin="5">Fertig</Button>
      </StackPanel>
   </Grid>
</Window>
'@

function Convert-XAMLtoWindow
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

$window = Convert-XAMLtoWindow -XAML $xaml 

# add click handlers
$window.ButOk.add_Click{
   # ausgewählten Dienst stoppen:
   $window.ComboService.SelectedItem | Stop-Service -WhatIf  # -WhatIf ggfs. Entfernen!
   Update-ComboBox
}

$window.ButCancel.add_Click{
   $window.DialogResult = $false
}

# aktualisiert den Inhalt der Combobox:
function Update-ComboBox
{
  # beliebige Daten in Combobox füllen
  # (in diesem Fall stoppbare Dienste)
  $window.ComboService.ItemsSource = Get-Service | 
                                        Where-Object Status -eq Running |
                                        Sort-Object -Property DisplayName

  # Eigenschaft angeben, die in Combobox sichtbar sein soll 
  # (in diesem Fall der deutsche Dienstname in "DisplayName")
  $window.ComboService.DisplayMemberPath = 'DisplayName'
  # ersten Listeneintrag vorwählen:
  $window.ComboService.SelectedIndex = 0
}

Update-ComboBox

Show-WPFWindow -Window $window
