Get-ChildItem -Path C:\windows\system32 -Filter *.dll | Select-Object -ExpandProperty VersionInfo | Out-GridView
