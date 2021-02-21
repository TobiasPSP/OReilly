#requires -Version 1

$drive = Get-PSDrive -PSProvider FileSystem -Name C

$free = $drive.Free
$used = $drive.Used
$total = $free + $used
$percent = $used / $total

'Gesamt:   {0,10:n1} GB' -f ($total/1GB) 
'Belegt:   {0,10:n1} GB' -f ($used/1GB) 
'Frei:     {0,10:n1} GB' -f ($free/1GB) 
'Belegung:    {0,10:p}' -f $percent
