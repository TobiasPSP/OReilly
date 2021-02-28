# Pfadnamen zu einem Logfile festlegen, wo Updates protokolliert werden
$logfile = Join-Path -Path $home -ChildPath powershell_updates.log
# Bildschirmausgaben an Logfile anhängen
Start-Transcript -Path $logfile -Append

# try...finally sorgt dafür, dass der Code in "finally" AUF JEDEN FALL
# ausgeführt wird, also auch dann, wenn der Code in "try" z.B. mit CTRL+C
# abgebrochen wird.
try
{

  # vorübergehend PowerShellGallery auf "Trusted" setzen, um ohne Rückfragen
  # bestehende Module zu aktualisieren:
  Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

  # Alle installierten Module überprüfen und bei Bedarf aktualisieren
  Update-Module -AcceptLicense -Verbose
}

finally
{
  # PowerShellGallery wieder auf "Untrusted" setzen, um bei neuen Installationen
  # zu bestätigen
  Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted

  # Log abschließen
  Stop-Transcript
}
