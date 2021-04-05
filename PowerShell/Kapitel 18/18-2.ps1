function Get-RemoteSessionUser
{
  param
  (
      $ComputerName,
      $Credential
  )

  Get-WmiObject -Class Win32_Process -Filter 'Name="wsmprovhost.exe"' @PSBoundParameters |
    ForEach-Object {
      $owner = $_.GetOwner()

      $rv = $_ | Select-Object -Property User, StartTime, ID
      $rv.StartTime = $_.ConvertToDateTime($_.CreationDate)
      $rv.User = '{0}\{1}' -f $owner.Domain, $owner.User
      $rv.ID = $_.ProcessID
      $rv
    }
}
