$CmdletName = 'Get-ChildItem'

(Get-Command -Name $CmdletName).ParameterSets | 
  ForEach-Object { $_.Parameters } | 
  Sort-Object -Property Name -Unique |
  ForEach-Object {
    if ($_.Position -ge 0)
    {
      $position = $_.Position
    else
    {
      $position = ''
    }
    [PSCustomObject]@{
      Name = $_.Name
      Position = $position
      Alias = $_.Aliases -join ','
      Werte = try { 
        
        ([Enum]::GetValues($_.ParameterType) | 
           ForEach-Object { '{0}={1}' -f [int]$_, $_}) -join ','
      } catch {}
    }
  }
