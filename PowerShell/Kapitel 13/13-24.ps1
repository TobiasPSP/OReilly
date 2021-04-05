#requires -Version 5

Enum ShowStates
{
  Hide                               = 0
  Normal                             = 1
  Minimized                          = 2
  Maximized                          = 3
  ShowNoActivateRecentPosition       = 4
  Show                               = 5
  MinimizeActivateNext               = 6
  MinimizeNoActivate                 = 7
  ShowNoActivate                     = 8
  Restore                            = 9
  ShowDefault                        = 10
  ForceMinimize                      = 11
}

function Set-Window
{
  param
  (
    [System.Diagnostics.Process]
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    $Process,
  
    [ShowStates]
    $Window = [ShowStates]::Normal
  )
  
  begin
  {
    $code = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
    $type = Add-Type -MemberDefinition $code -Name NativeMethods -namespace Win32 -PassThru
  }
  
  process
  {
    if ($process.MainWindowHandle -eq 0)
    {
      Write-Warning "Process $process has no window."
    }
    else
    {
      $type::ShowWindowAsync($process.MainWindowHandle, $Window)
    }
  }
}
