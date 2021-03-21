function Filter-FileSize
{
  param
  (
    [Parameter(Mandatory=$true)]
    [Int]
    $SizeKB,
    
    [Parameter(ValueFromPipeline=$true)]
    [System.IO.FileInfo]
    $File,
    
    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [Int]
    $Length
  )

  process
  {
    if (($Length/1KB) -ge $SizeKB ) { $File }
  }
}
