# normalerweise können mehrere Eigenschaften nur einheitlich
# auf- oder absteigend sortiert werden:

# alle aufsteigend:
Get-Service | Sort-Object -Property Status, Name
# alle absteigend:
Get-Service | Sort-Object -Property Status, Name -Descending

# mit Hashtables kann einer bestimmten Eigenschaft jeweils eine bestimmte
# Sortierrichtung zugewiesen werden:

$hashtable1 = @{
  Expression ='Name'
  Descending=$true 
}

# Status aufsteigend, Name absteigend:
Get-Service | Sort-Object -Property Status, $hashtable1

# in einer Zeile 
# (Hashtable-Schlüssel auf Anfangsbuchstaben verkürzt)
# (";" entspricht Zeilenumbruch)
Get-Service | Sort-Object -Property Status, @{E='Name';D=$true}
