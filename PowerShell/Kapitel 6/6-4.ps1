$liste = 1..100000

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

$eimer = @()

foreach($pc in $liste)
{
    $eimer += "PC $pc"
}

$stopwatch.Stop()
$stopwatch.Elapsed.TotalSeconds
