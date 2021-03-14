[Char[]](65..90) | Where-Object { (Test-Path "${_}:\") -eq $false }
