# zufälliges Kennwort aus drei Klein- und drei Großbuchstaben
# sowie einem Sonderzeichen und einer Zahl generieren
# mehrdeutige Zeichen wie "o" und "0" oder "l" und "1"
# ausschließen

# alle Ergebnisse des folgenden Skriptblocks
# gemeinsam weiterverarbeiten:
$zeichen = & {
  # drei Kleinbuchstaben
  'abcdefghkmnprstuvwxyz'.ToCharArray() | Get-Random -Count 3
  # drei Großbuchstaben
  'ABCDEFGHKLMNPRSTUVWXYZ'.ToCharArray() | Get-Random -Count 3
  # ein Sonderzeichen
  '!?=#&$-'.ToCharArray() | Get-Random -Count 1
  # eine Zahl
  '23456789'.ToCharArray() | Get-Random -Count 1
} |
# "Zutaten" des Kennworts durchmischen:
Sort-Object -Property { Get-Random }

# aus Zeichen ein Kennwort formen:
$kennwort = -join $zeichen
$kennwort
