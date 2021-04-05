$code = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'

$type = Add-Type -MemberDefinition $code -Name NativeMethods -namespace Win32 -PassThru
