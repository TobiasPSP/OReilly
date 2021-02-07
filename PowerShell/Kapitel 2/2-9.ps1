# aus diesen Zeichen soll das Kennwort bestehen können:
$text = 'a,b,c,d,e,f,g,h,k,m,n,p,r,s,t,u,v,w,x,y,z,2,3,4,5,6,7,8,9,!,$,%,&,=,?' 

# den langen Text an den Kommata aufsplitten. In $zeichen liegen nun die
# einzelnen Zeichen
$zeichen = $text -split ','

# aus den verfügbaren Zeichen für das Kennwort 6 Zeichen auswählen:
$zufallsauswahl = $zeichen | Get-Random -Count 6 

# die zufällig gewählten Zeichen mit -join zu einem Gesamttext zusammenfügen
# und zwischen den Zeichen kein Verbindungszeichen verwenden
$kennwort = $zufallsauswahl -join ''

# Kennwort ausgeben:
"Kennwort: $kennwort"
