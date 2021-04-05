$code = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$type = Add-Type -MemberDefinition $code -Name NativeMethods -namespace Win32 -PassThru

# auf den PowerShell-Prozess zugreifen:
$process = Get-Process -Id $PID
# dessen Window-Handle erfragen:
$hwnd = $process.MainWindowHandle

# Fenster vorübergehend verstecken:
$type::ShowWindowAsync($hwnd, 0)

Start-Sleep -Seconds 2

# Fenster wiederherstellen:
$type::ShowWindowAsync($hwnd, 9)
