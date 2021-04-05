function Test-PSRemoting
{
  # WinRM-Dienst
  $service = Get-Service -Name WinRM

  # Firewall-Ausnahmen...
  $firewall = @(Get-NetFirewallRule -Name WINRM-HTTP-In* | 
                  # ...die nicht disabled sind
                  Where-Object { $_.Enabled -eq $true })

  # Unterstützung für lokale Adminkonten
  $Path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system'
  $key = Get-ItemProperty -Path $Path

  # WSMan-Listener
  $Application = 'winrm/config/Listener'
  $Selector = @{Address='*';Transport='http'}
  $listener = @(Get-WSManInstance $Application -SelectorSet $Selector)

  # PSSessionConfigurations ...
  $config = @(Get-PSSessionConfiguration |
                  # ...die nicht disabled sind 
                  Where-Object { $_.SecurityDescriptorSDDL -notlike '*(D;;GA;;;NU)*' })

  [PSCustomObject]@{
      'WinRM-Service läuft' = $service.Status -eq 'Running'
      'Firewall erlaubt Zugriff' = $firewall.Count -eq 2
      'Unterstützung für lokale Adminkonten' = $key.LocalAccountTokenFilterPolicy -eq 1
      'WSMan-Listener konfiguriert' = $listener.Count -gt 0
      'PSSessionConfigurations aktiv' = $config.Count -gt 0
  }
}
