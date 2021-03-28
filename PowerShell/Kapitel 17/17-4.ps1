try
{
    1/0
}
catch
{
    Write-Warning $_.Exception.Message
}
