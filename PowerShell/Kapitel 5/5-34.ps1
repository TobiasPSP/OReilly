$gruppe = @{
  Name='Alter'
  Expression={
    Switch ((New-Timespan $_.LastWriteTime).Days) {
      { $_ -lt 10 } { 'neu'; continue }
      { $_ -lt 30 } { 'älter'; continue }
      { $_ -ge 30 } { 'sehr alt'; continue }
      default { 'Unbekannt' }
    }
  }
}

Get-ChildItem -Path $env:windir | 
  Sort-Object -Property LastWriteTime -Descending | 
  Format-Table Name, LastWriteTime, Length -Group $gruppe -Auto
