$Path = 'c:\neuerOrdner'

# prüfen, ob Ordner bereits existiert:
$existiert = Test-Path -Path $Path -PathType Container

# Vergleichsoperator prüft eine Bedingung...
if ($existiert -eq $false)
{
    # ...if-Struktur führt den ersten Skriptblock aus, wenn
    # der Vergleich $true ergab:
    $null = New-Item -Path $Path -ItemType Directory
    Write-Warning "Ordner $Path wurde neu angelegt."
}
else
{
    # andernfalls wird der Skriptblock hinter "Else" ausgeführt:
    Write-Warning "Ordner $Path existierte schon."
}
