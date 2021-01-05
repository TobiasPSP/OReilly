$dateiname = Get-Date -Format '"report_"yyyy-MM-dd-HH_mm_ss".txt"'
$pfadname = Join-Path -Path $env:temp -ChildPath $dateiname
$pfadname
