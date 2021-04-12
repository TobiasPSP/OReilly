function Test-Parameter
{
  param
  (
    [String]
    $Name,
  
    [int]
    $Id = -1
  )
  
  $PSBoundParameters
  
  if ($PSBoundParameters.ContainsKey('id'))
  {
    'Anwender hat ID manuell angegeben!'
  }

}
