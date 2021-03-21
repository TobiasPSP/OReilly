function Find-OldItem
{
  param
  (
    [Int]
    $Days
  )
  
  process
  {
    $CheckDate = (Get-Date).AddDays(-$Days)
    if ($_.LastWriteTime -lt $CheckDate) { $_ }
  }
}
