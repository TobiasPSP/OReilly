# existiert die PowerShell-Profildatei bereits?
$existiert = Test-Path -Path $profile

# falls nicht, diese Datei anlegen ...
if (!$existiert)
{
    $null = New-Item -Path $profile -ItemType File -Force
}

# ... danach im Notepad-Editor öffnen
notepad $profile
