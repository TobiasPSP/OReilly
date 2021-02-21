# aus diesen Zeichen soll das Kennwort zusammengesetzt werden:
# (sehr ähnliche Zeichen wie "q", "o", und "0" sind nicht enthalten)
$kleinbuchstaben = 'a,b,c,d,e,f,g,h,k,m,n,p,r,s,t,u,v,w,x,y,z'
$grossbuchstaben = $kleinbuchstaben.ToUpper()
$zahlen = '2,3,4,5,6,7,8,9'
$sonderzeichen = '§,$,%,&,?'

# kennwort aus zufälligen zeichen zusammensetzen:
$zeichen = $kleinbuchstaben.Split(',') | Get-Random -Count 3
$zeichen += $grossbuchstaben.Split(',') | Get-Random -Count 3
$zeichen += $zahlen.Split(',') | Get-Random -Count 1
$zeichen += $sonderzeichen.Split(',') | Get-Random -Count 1

# zeichen bunt zusammenwürfeln
$zeichen = $zeichen | Get-Random -Count 100

# zeichen zu einem text zusammensetzen:
$kennwort = $zeichen -join ''

# kennwort besteht aus 3 Klein- und 3 Großbuchstaben, einer Zahl
# und einem Sonderzeichen
$kennwort
