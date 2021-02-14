# Profil für aktuellen Benutzer, das für alle Hosts gilt:
$Path = $profile.CurrentUserAllHosts

# prüfen, ob Datei schon existiert:
$vorhanden = Test-Path -Path $Path

# falls nicht existiert...
if (-not $vorhanden)
{
    # Datei inklusive aller fehlenden Unterordner anlegen:
    $null = New-Item -Path $Path -ItemType File -Force
}

# Datei nun mit dem assoziierten Programm öffnen und im Kontextmenü
# den Befehl "Bearbeiten" (Edit) aufrufen:
Start-Process -FilePath $Path -Verb Edit
