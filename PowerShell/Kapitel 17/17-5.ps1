$computer = Read-Host -Prompt 'Geben Sie Computernamen ein'

try
{
    [System.Net.DNS]::GetHostByName($Computer)
}
catch
{
    Write-Warning $_.Exception.InnerException.Message
}
