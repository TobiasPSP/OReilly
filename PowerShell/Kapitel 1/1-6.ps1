Invoke-RestMethod -UseBasicParsing -Uri 'https://get.scoop.sh' | Invoke-Expression
scoop install git
scoop bucket add extras
