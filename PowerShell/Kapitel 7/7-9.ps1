$path = "$env:temp\updates.txt"

$filter = @{ 
    ProviderName="Microsoft-Windows-WindowsUpdateClient"
    Id=19 
}

Get-WinEvent -FilterHashtable $filter | Out-File -FilePath $path
notepad $path
