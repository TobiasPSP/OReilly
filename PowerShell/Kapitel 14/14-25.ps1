$parameter = @{
  Path        = 'c:\windows'
  Recurse     = $true
  Filter      =  '*.ps1'
  Include     = '*.ps1'
  File        = $true
  ErrorAction = 'Ignore'
}

Get-ChildItem @parameter
