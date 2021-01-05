$datum = Get-Date
$zeitstempel = $datum.ToString('yyyy-MM-dd-HH_mm_ss')
$dateiname = "report_$zeitstempel.txt"
$pfadname = Join-Path -Path $env:temp -ChildPath $dateiname
$pfadname
