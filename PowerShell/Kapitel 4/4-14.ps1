# standardmäßig ist die Sortierung alphanumerisch:
'10.10.12.1','2.3.4.5','12.1.2.3','100.1.2.3' | Sort-Object

"=" * 80

# korrekte Sortierung durch vorübergehende Umwandlung
# der Daten in einen anderen Datentyp (hier: [Version])
# der Skriptblock wird für jedes einlaufende Objekt einmal
# ausgeführt, $_ entspricht dem jeweils einlaufenden
# Objekt:
'10.10.12.1','2.3.4.5','12.1.2.3','100.1.2.3' | 
  Sort-Object -Property { $_ -as [Version]}
