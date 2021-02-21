Get-Process | 
Where-Object Company |
Group-Object Company -NoElement | 
Sort-Object Count -Descending
