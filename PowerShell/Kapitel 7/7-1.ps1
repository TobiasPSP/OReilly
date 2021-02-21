# alle Cmdlets mit den angegebenen Stichworten in Noun finden, die aus einem
# Modul stammen, das von PowerShell selbst stammt.
# anschließend nach Noun und dann nach Verb sortieren
# Ausgabe als Spalten. Die Gruppierungsüberschrift soll "Familie" heissen
# und die Eigenschaft Noun der jeweils gefundenen Befehle ($_) anzeigen:
Get-Command -Noun *Item, ItemProperty, Path, Content -Module Microsoft.PowerShell.* | 
  Sort-Object -Property Noun, Verb |
  Format-Wide -Property Name -GroupBy @{Name='Familie'; Expression={$_.Noun}} -AutoSize
