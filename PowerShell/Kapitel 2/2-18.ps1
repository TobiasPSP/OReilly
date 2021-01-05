$china = [CultureInfo]::new("zh-Hans")
$datum = Get-Date
$datum.ToString('dddd, dd. MMMM yyyy',$china)
