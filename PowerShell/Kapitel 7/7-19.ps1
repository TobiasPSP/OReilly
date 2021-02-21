$stichwort = Read-Host -Prompt 'Nach welchem Wort in Ihrem Skript suchen Sie'

Get-ChildItem -Path $home -Filter *.ps1 -Recurse -ErrorAction SilentlyContinue |
  Select-String -Pattern $stichwort -List |
  Select-Object -Property LineNumber, Line, FileName, Path |
  Out-GridView -Title 'Datei aussuchen' -OutputMode Multiple |
  Select-Object -ExpandProperty Path
