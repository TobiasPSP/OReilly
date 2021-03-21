function Get-WürfelErgebnis
{
  param
  (
    [ValidateRange(1,3)]
    [Int]
    $Würfe = 1
  )

  for($x=1; $x -le $Würfe; $x++) 
  {
    Get-Random -Minimum 1 -Maximum 7  
  }
}
