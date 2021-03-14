# maximal 5 Sekunden warten, bis der Prozess 
# gekillt wird
$Timeout = 5000

$prozess = Start-Process -FilePath notepad -PassThru
$null = Read-Host "Geben Sie Text in den Editor ein, und drücken Sie dann hier ENTER!"

# Schließen-Aufforderung an Prozess senden:
$erfolg = $prozess.CloseMainWindow()

if ($erfolg)
{
    # maximal 5 Sekunden darauf warten, dass der Prozess
    # beendet wird
    $null = $prozess.WaitForExit($Timeout)
}

# wenn der Prozess noch läuft, sofort beenden:
if ($prozess.HasExited -eq $false)
{
    $prozess.Kill()
}
