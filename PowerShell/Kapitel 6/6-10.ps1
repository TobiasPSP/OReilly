$hashtable = @{
    MultiSelect = $false
    CheckFileExists = $true
    InitialDirectory = "$Home\Documents"
    Title = 'PowerShell Skript auswählen'
    Filter = 'PS-Skript|*.ps1|Alles|*.*'
}

Add-Type -AssemblyName PresentationFramework
$dialog = [Microsoft.Win32.OpenFileDialog]$hashtable

$ok = $dialog.ShowDialog()
if ($ok)
{
  $dialog.FileName
}
