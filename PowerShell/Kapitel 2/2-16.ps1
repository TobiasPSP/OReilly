$path = "$env:temp\report.html"
$daten = Get-Service
$tabelle = { New-HTMLTable -DataTable $daten }
New-HTML -HtmlData $tabelle -FilePath $path -ShowHTML -TitleText 'Dienste'
