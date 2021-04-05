# Hinweis: Wenn Sie den lokalen Computer abfragen wollen,
# muss dieses Skript mit Administratorrechten ausgeführt 
# werden.

# diesen Computer mit aktueller Identität abfragen
$Computer1 = 'dell1'

# diesen Computer mit dem Benutzerkonto "PSRemoting" abfragen
# (Konto muss auf dem Computer existieren und über Adminrechte verfügen)
$Computer2 = 'tobiasair1'
$Credential2 = Get-Credential -Credential PSRemoting

# ein leeres Array anlegen:
$Sessions = @()
# nacheinander beliebig viele manuell konfigurierte Sessions hinzufügen
$Sessions += New-PSSession -ComputerName $Computer1
$Sessions += New-PSSession -ComputerName $Computer2 -Credential $Credential2

# Code, der in den Sessions ausgeführt werden soll:
$code = 
{
  # Systeminventar als CSV generieren und in Objekte wandeln:
  $Spaltennamen = 'Hostname',
  'Betriebssystemname',
  'Betriebssystemversion',
  'Betriebssystemhersteller',
  'Betriebssystemkonfiguration',
  'BetriebssystemBuildtyp',
  'RegistrierterBenutzer',
  'RegistrierteOrganisation',
  'ProduktID',
  'Installationsdatum',
  'Systemstartzeit',
  'Systemhersteller',
  'Systemmodell',
  'Systemtyp',
  'Prozessor',
  'BIOSVersion',
  'WindowsVerzeichnis',
  'SystemVerzeichnis',
  'Startgeraet',
  'Systemgebietsschema',
  'Eingabegebietsschema',
  'Zeitzone',
  'GesamterPhysischerSpeicher',
  'VerfügbarerPhysischerSpeicher',
  'VirtuellerArbeitsspeicherMax',
  'VirtuellerArbeitsspeicherVerfügbar',
  'VirtuellerArbeitsspeicherVerwendet',
  'Auslagerungsdateipfad',
  'Domaene',
  'Anmeldeserver',
  'Hotfixes',
  'Netzwerkkarte',
  'HyperV'
                    


  systeminfo.exe /FO CSV | 
  Select-Object -Skip 1 |
  ConvertFrom-CSV -Header $Spaltennamen
}

# Code in allen Sessions gleichzeitig ausführen:
Invoke-Command -ScriptBlock $code -Session $sessions | 
  Out-GridView -Title Systemübersicht

# Sessions am Ende entfernen
Remove-PSSession -Session $Sessions
