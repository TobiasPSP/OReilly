$path = 'HKCU:\Test\LogonSkripts\Protokoll\Erfolgreich'
$exists = Test-Path -Path $path
if (!$exists)
{
    $null = New-Item -Path $path -Force
    Write-Warning 'Schlüssel angelegt.'
}
else
{
    Write-Warning 'Schlüssel schon vorhanden.'
}
