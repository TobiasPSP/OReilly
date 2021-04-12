$liste = 1..100000

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

$eimer = [System.Collections.ArrayList]@()
foreach($pc in $liste)
{
    $null = $eimer.Add("PC $pc")
}

$stopwatch.Stop()
$stopwatch.Elapsed.TotalSeconds

$eimer.Count
