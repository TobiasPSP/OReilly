$zeitstempel = Get-Date -Format 'yyyy-MM-dd-HH_mm_ss'
$dateiname = "report_$zeitstempel.txt"
$pfadname = Join-Path -Path $env:temp -ChildPath $dateiname
$pfadname
