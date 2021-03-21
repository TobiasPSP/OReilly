function Receive-ProcessID
{
  param
  (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName = $true)]
    [Int]
    $ID
  )

  process
  {
    "bearbeite Prozess-ID $id"
  }
}
