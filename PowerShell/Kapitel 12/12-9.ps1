filter Get-Constructor 
{
  $type = $_
         
  foreach($constructor in $type.GetConstructors())
  {
    $info = $constructor.GetParameters().Foreach{$_.ToString()} -Join ', '
    "($info)"
  }
}
