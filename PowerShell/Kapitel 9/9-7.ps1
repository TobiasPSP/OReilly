Get-Service |
  ForEach-Object {
    '{0,-35} : {1,-28}' -f $_.Name, $_.Status
  }
