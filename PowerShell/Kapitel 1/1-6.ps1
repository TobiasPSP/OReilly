# Wurzelordner der Profilskripte ermitteln
$path = Split-Path $profile.CurrentUserAllHosts
$path = Split-Path $path

# Pfade der Profilskripte für PowerShell und WindowsPowerShell:
$path1 = Join-Path -Path $path -ChildPath WindowsPowerShell
$path2 = Join-Path -Path $path -ChildPath PowerShell

# Profilskript anlegen, falls es noch nicht existiert,
# dann beide im assoziierten Programm (Editor) öffnen:
$path1, $path2 | ForEach-Object {
    $filePath = Join-Path -Path $_ -ChildPath profile.ps1
    $exists = Test-Path -Path $filePath
    if (!$exists) { $null = New-Item -Path $Path -ItemType File -Force}
    Invoke-Item -Path $filePath
}
