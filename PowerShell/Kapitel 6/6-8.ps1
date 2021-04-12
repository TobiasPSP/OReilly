$liste = 1..100000

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

$eimer = [System.Collections.Generic.List[string]]@()
foreach($pc in $liste)
{
    $eimer.Add("PC $pc")
}

$stopwatch.Stop()
$stopwatch.Elapsed.TotalSeconds

$eimer.Count
