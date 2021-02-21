$path = "$env:temp\Updates.txt"

$filter = @{ 
    ProviderName="Microsoft-Windows-WindowsUpdateClient"
    Id=19 
}

Get-WinEvent -FilterHashtable $filter | 
    Foreach-Object {'{0:dd. MMM yyyy}: {1}' -f $_.TimeCreated, $_.Properties[0].Value} |
    Out-File -FilePath $path

notepad $path
