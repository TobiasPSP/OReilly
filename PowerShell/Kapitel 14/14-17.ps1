function Get-BIOS
{
  [CmdletBinding(DefaultParameterSetName='ParameterSet1')]
  param
  (
    [Parameter(ParameterSetName='ParameterSet1', Position=0, Mandatory=$false)]
    [Parameter(ParameterSetName='ParameterSet2', Mandatory=$true)]
    [String]
    $ComputerName,
    
    [Parameter(ParameterSetName='ParameterSet2', Position=0, Mandatory=$false)]
    [PSCredential]
    $Credential
  )
  
  
  Get-WmiObject -Class Win32_BIOS @PSBoundParameters
  
  
  
}
