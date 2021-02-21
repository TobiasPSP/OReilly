$path = 'c:\neuerordner'
$null = (Test-Path -Path $path) ? '' : (New-Item -Path $path -ItemType Directory)
