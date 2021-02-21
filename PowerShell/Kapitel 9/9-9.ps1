$driveC = Get-CimInstance -ClassName Win32_LogicalDisk -Filter 'DeviceID="C:"'
$sizeByte = $driveC.Size
$sizeGB = $sizeByte / 1GB

'Festplatte C:\ Größe: {0:n1} GB' -f $sizeGB
