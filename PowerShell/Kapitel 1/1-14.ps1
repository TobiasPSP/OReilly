# Datei anlegen, wenn noch nicht vorhanden
$exists = Test-Path -Path $profile
if ($exists -eq $false)
{
    $null = New-Item -Path $profile -ItemType File -Force
    Write-Warning "Profilskript angelegt."
}
else
{
    Write-Warning "Profilskript war vorhanden."
}

# Profilskript im assoziierten Editor öffnen:
Invoke-Item -Path $profile
