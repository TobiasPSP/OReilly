function Test-PipelineInput {
  param (
    [Parameter(ValueFromPipeline=$true)]
    [double]
    $Zahl=-1,

    [Parameter(ValueFromPipeline=$true)]
    [datetime]
    $Datum = (Get-Date),

    [Parameter(ValueFromPipeline=$true)]
    [bool]
    $Boolean = $false,

    [Parameter(ValueFromPipeline=$true)]
    $Objekt = $null
  )

  process {
    "Zahl: $Zahl"
    "Datum: $Datum"
    "Ja/Nein: $Boolean"
    "Objekt: $Objekt"
  }
}
