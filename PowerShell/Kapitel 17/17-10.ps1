try
{
    # Cmdlet-Gehler, benötigt ErrorAction=Stop
    $ErrorActionPreference = 'Stop'
    Get-ChildItem -Path GibtEsNicht
}
catch
{
    # Objektstruktur in $_ visualisieren:
    $_ | Format-Custom -Property * -Depth 1 -Force 
    # Fehlerinformationen mit der Funktion Get-ErrorDetail
    # auswerten (Funktion muss wie beschrieben vorher
    # definiert worden sein)
    $_ | Get-ErrorDetail | Out-GridView
}
