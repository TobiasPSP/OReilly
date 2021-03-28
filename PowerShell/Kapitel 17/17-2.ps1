$ListEXE = Get-ChildItem -Path $env:windir -Recurse -Filter *.exe -ErrorVariable fehler -ErrorAction SilentlyContinue
$listProc = Get-Process -FileVersionInfo -ErrorVariable +fehler -ErrorAction SilentlyContinue

"Fehler insgesamt: {0}" -f $fehler.Count

$fehler | Get-ErrorDetail | Out-GridView
