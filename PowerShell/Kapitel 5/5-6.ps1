$files = Get-ChildItem -Path c:\windows -Recurse -Filter *.log -ErrorAction Ignore
$files | Where-Object Length -gt 10MB
