Get-ChildItem -Path c:\windows -Recurse -Filter *.log -ErrorAction Ignore | Where-Object Length -gt 10MB
