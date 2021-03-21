function Test-Optional
{
  param
  (
    $ComputerName = $env:COMPUTERNAME
  )

    if ($PSBoundParameters.ContainsKey('ComputerName') -eq $false)
    {
        $null = $PSBoundParameters.Add('ComputerName', $ComputerName)
    }

    $PSBoundParameters
}
