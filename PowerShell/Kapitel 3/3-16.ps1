function Out-TextToSpeech
{
  [CmdletBinding()]
  param
  (
    [Parameter(Mandatory)]
    [string]
    $Text, 

    [int]
    $LanguageId = 409,

    [int]
    $Rate = 0 
  )
  $tts = New-Object -ComObject Sapi.SpVoice
  $tts.Rate = $Rate
  $ttsText = "<lang langid='$LanguageId'>$Text</lang>"
  $null = $tts.Speak($ttsText)
}
