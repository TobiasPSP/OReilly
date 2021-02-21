# dieser Ordner soll existieren:
$Path = 'c:\neuerordner'

# prüfen, ob Ordner schon vorhanden ist:
$ergebnis = Test-Path -Path $Path

# Kriterium
$ordnerFehltNoch = $ergebnis -eq $false

# Bedingung bestimmt, welcher Skriptblock ausgeführt wird:
if ($ordnerFehltNoch)
{
    # Ergebnis von New-Item an $null zuweisen,
    # weil das Ergebnis nicht gebraucht wird
    $null = New-Item -Path $Path -ItemType Directory
    Write-Warning 'Neuer Ordner angelegt'
}
else
{
    Write-Warning "Ordner '$path' war bereits vorhanden."
}
