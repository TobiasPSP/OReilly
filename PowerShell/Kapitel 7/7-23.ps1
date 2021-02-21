# PowerShell-Profil kopieren
# dieses Profil ist der Parent-Folder des Profilskripts, dessen Pfad in 
# $profile vorliegt:
$quelle = Split-Path $profile
$ziel   = 'c:\Sicherheitskopie'

# ein PowerShell-Profil muss nicht unbedingt existieren
# wenn Sie keine persönlichen Anpassungen vorgenommen haben, z.B. ein
# Profilskript angelegt oder weitere Module im Scope CurrentUser nachinstalliert
# haben, dann gibt es ggfs. noch keinen Profilordner:
$existiert = Test-Path -Path $quelle
if (!$existiert)
{
	Write-Warning "Das Profil $quelle existiert nicht - nichts zu kopieren!"
	return
}

# Originalprofil in Sicherheitskopie speichern:
Copy-Item -Path $quelle -Destination $ziel -Recurse -Force

explorer $ziel
