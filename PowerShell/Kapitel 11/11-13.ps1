Start-Process powershell.exe -ArgumentList '-noprofile -command [AppDomain]::CurrentDomain.GetAssemblies().Fullname.Foreach{$_.Split('','')[0]} | Sort-Object | clip'
