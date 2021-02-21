Get-ChildItem -Path $env:windir\system32 -Filter *.dll -Recurse -ErrorAction Ignore |
  Select-Object -Property Name -ExpandProperty VersionInfo |
  Select-Object -Property Name, FileVersionRaw, FileDescription, FileName
