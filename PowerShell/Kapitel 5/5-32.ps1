$combined = @{Expression={ '{0} ({1:#,##0} Tage)' -f $_.Name, ((New-Timespan $_.LastWriteTime).Days) }}
Get-ChildItem -Path $env:windir -File | Format-Wide $combined -Column 3
