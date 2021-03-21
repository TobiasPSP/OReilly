function Get-Drive
{
  param
  (
    $ComputerName,
    $Credential
  )

    Get-WmiObject -Class Win32_LogicalDisk @PSBoundParameters |
      Select-Object DeviceID, VolumeName, Size, FreeSpace
}
