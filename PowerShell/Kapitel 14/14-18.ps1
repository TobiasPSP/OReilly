function Test-Risk
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param()

    Stop-Service -Name Spooler
    Start-Service -Name Spooler
}
