$liste = 1..100000

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()

$eimer = & {
  # Ergebnisse dieses Skriptblocks werden ggfs. in Array verwandelt
  foreach($pc in $liste)
  {
    "PC $pc"
  }


}
stopwatch.Stop()
$stopwatch.Elapsed.TotalSeconds

$eimer.Count
