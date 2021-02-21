$combined = @{Expression={ '{0} ({1:dd.MM.})' -f $_.Name, $_.LastWriteTime }}
Get-ChildItem -Path $env:windir | Format-Wide $combined -Column 3
