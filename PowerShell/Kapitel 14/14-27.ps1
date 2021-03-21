function Get-Drive
{
    Get-WmiObject -Class Win32_LogicalDisk |
      Select-Object DeviceID, VolumeName, Size, FreeSpace
}
