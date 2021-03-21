function Find-OldItem
{
  param
  (
    [Parameter(ValueFromPipeline=$true)]
    [System.IO.FileSystemInfo]
    $Item,
    
    [Parameter(Mandatory = $true)]
    [Int]
    $Days
  )
  
  begin
  {
    $CheckDate = (Get-Date).AddDays(-$Days)
  }
  process
  {
    if ($Item.LastWriteTime -lt $CheckDate)
    {
      $Item
    }
  }
}
