function Get-Drive
{
  param
  (
    $ComputerName,
    $Credential,
    [Switch]
    $AsGridView
  )

    $null = $PSBoundParameters.Remove('AsGridView')

    $result = Get-WmiObject -Class Win32_LogicalDisk @PSBoundParameters |
      Select-Object DeviceID, VolumeName, Size, FreeSpace

    if ($AsGridView)
    {
        $result | Out-GridView
    }
    else
    {
        $result
    }
}
