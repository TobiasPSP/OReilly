function Start-Executable
{
  param
  (
    [ValidateScript({ (Get-ChildItem $env:windir\system32 "$_.exe").Count -eq 1})]
    [Parameter(Mandatory=$true)]
    [String]
    $Name
  )

  $path = Join-Path -Path $env:windir\system32 -ChildPath $Name
  Start-Process -FilePath $path
}
