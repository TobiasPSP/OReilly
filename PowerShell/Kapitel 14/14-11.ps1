#requires -Version 7.0

function Get-WürfelErgebnis
{
  param
  (
    [ValidateRange(1,3)]
    [Int]
    $Würfe = 1
  )

  Get-Random -Minimum 1 -Maximum 7 -Count $Würfe  
}
