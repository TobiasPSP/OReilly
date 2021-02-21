Get-NetAdapter | 
  Out-GridView -Title 'Welchen Netzwerkadapter abfragen?' -PassThru |
  Get-NetAdapterAdvancedProperty
