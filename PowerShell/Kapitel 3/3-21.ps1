function Out-TextToSpeech([string]$Text='Hello User!',[int]$LanguageId=409,[int]$Rate=0)
{
  $Text = 'I am PowerShell, and your system will shut down soon.'
  $Rate = 0
  $LangId = 409

  $tts = New-Object -ComObject Sapi.SpVoice
  $tts.Rate = $Rate
  $ttsText = "<lang langid='$LangId'>$Text</lang>"
  $null = $tts.Speak($ttsText)
}
