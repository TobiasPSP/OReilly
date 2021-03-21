function Test-Risk
{
    [CmdletBinding(SupportsShouldProcess=$true)]
    param()

    $message1 = $env:COMPUTERNAME
    $message2 = 'Spooler-Dienst neu starten'
    $doit = $PSCmdlet.ShouldProcess($message1, $message2)

    if ($doit)
    {
        Stop-Service -Name Spooler
        Start-Service -Name Spooler
    }
}
