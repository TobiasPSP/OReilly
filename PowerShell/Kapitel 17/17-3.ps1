# Standardwerte für Fehlerhandling setzen
$PSDefaultParameterValues_old = $PSDefaultParameterValues
$ErrorActionPreference_old = $ErrorActionPreference

$fehler = $null
$PSDefaultParameterValues =@{}
$PSDefaultParameterValues.Add('*:ErrorVariable','+fehler')
$ErrorActionPreference = 'SilentlyContinue'


$ListEXE = Get-ChildItem -Path $env:windir -Recurse -Filter *.exe 
$listProc = Get-Process -FileVersionInfo 

"Fehler insgesamt: {0}" -f $fehler.Count

$fehler | Get-ErrorDetail | Out-GridView

# vorherige Werte zurücksetzen
$PSDefaultParameterValues = $PSDefaultParameterValues_old
$ErrorActionPreference = $ErrorActionPreference_old
