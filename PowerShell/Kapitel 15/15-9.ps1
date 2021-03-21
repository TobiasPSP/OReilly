function Format-File
{
  param
  (
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [String]
    $Name,
    
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Int]
    $Length,
    
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [String]
    $FullName
  )

  process
  {
    "empfange $Name mit Größe $Length von $FullName"
    'empfange {0,-10} mit Größe {1:n1} MB von {2}' -f $Name, ($Length/1MB), $FullName
  }
}
