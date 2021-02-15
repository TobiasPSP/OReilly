Get-ChildItem -Path $env:windir -Recurse -File -Filter *.log -ErrorAction Ignore |
  Select-String -Pattern Error -ErrorAction Ignore |
  Select-Object LineNumber, Path, Line |
  Out-GridView
