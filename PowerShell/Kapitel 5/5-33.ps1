$gruppe = @{Name='Anfangsbuchstabe'; Expression={$_.Name.Substring(0,1).toUpper()}}

Get-ChildItem -Path $env:windir | 
Sort-Object -Property Name | 
Format-Table Name, LastWriteTime, Length -Group $gruppe -AutoSize
