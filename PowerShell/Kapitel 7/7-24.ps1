# PowerShell-Profil kopieren
$quelle = Split-Path $profile
$ziel   = 'c:\Sicherheitskopie'

$null = robocopy.exe $quelle $Ziel /R:0 /S

explorer $ziel
