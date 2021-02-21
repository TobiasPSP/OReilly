# normaler Umgang mit Variablen:

# schreiben:
$a = 1

# lesen:
$a

# tatsächlich lautet die volle Schreibweise so:

# schreiben:
$variable:a

# lesen:
$variable:a

# alle "normalen" Variablen werden also auf dem Laufwerk "variable:" gespeichert
# PowerShell verwendet dieses Laufwerk als Vorgabe, wenn Sie hinter "$" kein
# Laufwerk angeben

# alle derzeit definierten Variablen ausgeben:
Get-ChildItem -Path variable: | 
  Select-Object -Property Name, Value, Description | 
  Out-GridView
