Get-WinEvent -LogName Microsoft-Windows-Ntfs/Operational -MaxEvents 5 |
Select-Object -Property TimeCreated, Id, Message |
Format-Table -Wrap
