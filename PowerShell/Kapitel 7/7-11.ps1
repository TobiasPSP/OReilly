$path = "$env:temp\Updates.txt"

$filter = @{ 
    ProviderName="Microsoft-Windows-WindowsUpdateClient"
    Id=19 
}

Get-WinEvent -FilterHashtable $filter | 
    Select-Object -Property TimeCreated, Message |
    Format-Table -AutoSize -Wrap |
    Out-File -FilePath $path -Width 120

notepad $path
