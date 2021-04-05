function Set-RemoteDesktop
{
  param
  (
    $ComputerName,

    $Credential,

    [switch]
    $Disable
  )

  # diesen Parameter nicht an Invoke-Command weitergeben
  $null = $PSBoundParameters.Remove('Disable')

  $code = {
    param([bool]$Disable)

    $key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server'
    if ($Disable) {
        $Value = 1
    }
    else {
        $Value = 0
    }
    Set-ItemProperty -Path $key -Name fDenyTSConnections -Value ([int]$Value) -Type DWORD

    if ($Disable)
    {
      netsh.exe advfirewall firewall set rule group="Remotedesktop" new enable=no
      Write-Warning "Remote Desktop disabled on \\$env:COMPUTERNAME"
    }
    else
    {
      netsh.exe advfirewall firewall set rule group="Remotedesktop" new enable=yes
      Write-Warning "Remote Desktop enabled on \\$env:COMPUTERNAME"
    }
  }

  Invoke-Command -ScriptBlock $code @PSBoundParameters -ArgumentList $Disable
}
