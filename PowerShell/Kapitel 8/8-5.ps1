$Path = 'c:\neuerOrdner'

(Test-Path -Path $Path -PathType Container) ? $(Write-Warning "Ordner $Path existierte schon.") : $($null = New-Item -Path $Path -ItemType Directory; Write-Warning "Ordner $Path wurde neu angelegt.")
