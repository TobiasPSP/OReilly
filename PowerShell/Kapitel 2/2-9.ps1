Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\' | 
Select-Object -Property DisplayVersion, CurrentBuildNumber, UBR, RegisteredOwner, RegisteredOrganization
