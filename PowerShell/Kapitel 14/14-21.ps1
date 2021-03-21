function Configure-System 
{
  [CmdletBinding(ConfirmImpact='High')]
  Param()

  ' Ich werde immer ausgeführt!'
  if ($PSCmdlet.ShouldProcess('Configure-System', 'Änderungen am System'))
  {
    'Ich werde nur ausgeführt, wenn Sie zustimmen!'
  }
  else
  {
    'Ich werde ausgeführt, wenn Sie NICHT zustimmen'
  }
  'Ich werde auch immer ausgeführt!'
}
