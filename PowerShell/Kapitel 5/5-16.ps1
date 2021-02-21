Get-ChildItem -Path $env:windir -File | Select-Object -Property Mode, LastWriteTime, @{N='Length(KB)';E={[Math]::Round(($_.Length/1KB),1)}}, Name
