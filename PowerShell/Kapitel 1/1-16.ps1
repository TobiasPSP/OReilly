#requires -RunAsAdministrator
# Hardlinks können nur als Administrator angelegt werden

# dieses Skript macht nur Sinn, wenn das Betriebssystem "Windows" ist:
if ($isWindows -eq $false) 
{
    Write-Warning "Das Spiegeln auf das Windows PowerShell-Profil ist nur bei Windows möglich."
    Write-Warning "Andere Betriebssysteme verfügen über kein Windows PowerShell"
}


# nur sinnvoll für PowerShell-Konsolen 
# (nicht für den ISE-Editor, den es bei PowerShell Core nicht gibt, also kann auch sein Profil nicht gespiegelt werden)
if ($host.Name -ne 'ConsoleHost')
{
    Write-Warning 'Nur PowerShell-Konsolen existieren als Zwillinge in Windows PowerShell und PowerShell'
    Write-Warning 'Deshalb kann auch nur dort das Profil gespiegelt werden.'
    Write-Warning 'Führen Sie dieses Skript in einer PowerShell-Konsole oder VSCode aus!'
    return
}

# sicherstellen, dass die Windows PowerShell Profildatei existiert
if ($PSVersionTable.PSEdition -eq 'Core')
{
    # Pfad zum Windows PowerShell Profilskript berechnen: 
    $winprofile = $profile -replace '\\PowerShell\\', '\WindowsPowerShell\'
}
else
{
    # Pfad steht bei Windows PowerShell schon in $profile:
    $winprofile = $profile
}

# Datei anlegen, wenn noch nicht vorhanden
$exists = Test-Path -Path $winprofile
if ($exists -eq $false)
{
    $null = New-Item -Path $winprofile -ItemType File -Force
    Write-Warning "Profilskript für Windows PowerShell angelegt."
}
else
{
    Write-Warning "Profilskript für Windows PowerShell war vorhanden."
}

# wenn dies eine Windows PowerShell ist, sind wir fertig
if ($PSVersionTable.PSEdition -ne 'Core') 
{
    # Profilskript im Editor öffnen:
    Invoke-Item -Path $winprofile 
    return 
}

# testen, ob Profilskript für PowerShell existiert
$exists = Test-Path -Path $profile
if ($exists)
{
    # ist die Profildatei vielleicht bereits gespiegelt?
    $datei = Get-Item -Path $profile
    if ($datei.LinkType -eq 'HardLink')
    {
        # wir sind fertig
        Write-Warning 'Profildatei von Windows PowerShell wird bereits mitgenutzt (keine Änderungen).'

        # Profilskript im Editor öffnen:
        Invoke-Item -Path $winprofile 
        return
    }
    else
    {
        # wenn PowerShell bereits eine eigene Profildatei verwendet, muss diese
        # gelöscht werden, um stattdessen auf das Windows Profil zu verweisen
        # also nachfragen, ob der User das will:
        Write-Warning 'Profilskript für PowerShell ist bereits als separate Datei vorhanden.'
        Write-Warning 'Soll dieses Profil gelöscht und stattdessen das Profil der Windows PowerShell verwendet werden?'

        # Frage stellen und 20 Sekunden warten, danach "NEIN" wählen:
        choice.exe /C JN /M "Drücken Sie J für Ja oder N für Nein" /T 20 /D N
        
        # choice.exe liefert einen ErrorLevel in $LastExitCode zurück, der
        # Zahlenwert entspricht der Auswahl (1=Ja, 2=Nein)
        if ($LASTEXITCODE -eq 2) { return }
        
        # Profildatei löschen
        Remove-Item -Path $Profile -Force
    }
}

# Hardlink anlegen (erfordert Adminrechte)
$null = New-Item -Path $profile -ItemType HardLink -Value $winprofile 

Write-Warning 'Profildatei von Windows PowerShell wird nun mitgenutzt.'
Write-Warning "Um die Spiegelung aufzuheben, einfach die Profildatei $profile löschen und von Hand oder im Editor neu angelegen."

# Profilskript im Editor öffnen:
Invoke-Item -Path $winprofile
