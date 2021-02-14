# Datei anlegen, wenn noch nicht vorhanden
$path = $profile.CurrentUserAllHosts
$exists = Test-Path -Path $path
if ($exists -eq $false)
{
    $null = New-Item -Path $path -ItemType File -Force
    Write-Warning "Profilskript angelegt."
}
else
{
    Write-Warning "Profilskript war vorhanden."
}

# Profilskript im assoziierten Editor öffnen:
Invoke-Item -Path $path
