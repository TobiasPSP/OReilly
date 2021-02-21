#requires -Version 2.0 -Modules ImportExcel

$filter = @{ 
    ProviderName="Microsoft-Windows-WindowsUpdateClient"
    Id=19 
}

Get-WinEvent -FilterHashtable $filter | Export-Excel
