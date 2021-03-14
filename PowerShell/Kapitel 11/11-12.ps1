$typname = 'System.Management.Automation.TypeAccelerators'
  $typ = [psobject].Assembly.GetType($typname)
  ($typ::Get).GetEnumerator() |
    Where-Object { $_.Value.FullName -notlike '*attribute' } |
    Sort-Object -Property Key
