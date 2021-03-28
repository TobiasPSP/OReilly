try
{
    # Cmdlet-Fehler, benötigt ErrorAction=Stop
    $ErrorActionPreference = 'Stop'
    Get-ChildItem -Path GibtEsNicht
}
catch
{
    "Fehler entdeckt: $_"
}

try
{
    # Konsolenbefehl-Fehler benötigt ErrorAction=Stop
    # und Umleitung des Fehlerkanals
    $ErrorActionPreference = 'Stop'
    net user GibtEsNicht 2>&1
}
catch
{
    "Fehler entdeckt: $_"
}

try
{
    # .NET-Fehler benötigt keine besondere ErrorAction
    [System.Net.DNS]::GetHostByName('gibtesnicht')
}
catch
{
    "Fehler entdeckt: $_"
}
