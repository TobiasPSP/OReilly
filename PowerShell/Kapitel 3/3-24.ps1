$name = 'Out-TextToSpeech'
$path = Split-Path -Path $profile
$code = "function $name { $((Get-Item function:\$name).Definition) }"
New-Item -Path $path\Modules\$name\$name.psm1 -ItemType File -Force -Value $code
