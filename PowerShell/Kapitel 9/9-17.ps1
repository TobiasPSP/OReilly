$text = 'Server77625.'

# 6 Zeichen hinter dem Wort beginnt die Zahl:
$positionAnfang = $text.IndexOf('Server') + 6
# 1 Zeichen hinter dem Punkt endet die Zahl: 
$positionEnde = $text.IndexOf('.', $positionAnfang+1)

# Zahl mit den berechneten Positionen aus dem Text extrahieren:
$text.Substring($positionAnfang, $positionEnde - $positionAnfang)
