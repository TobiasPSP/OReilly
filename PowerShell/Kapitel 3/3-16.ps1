# hier werden die verschlüsselten Informationen gespeichert:
$Path = "$home\credstore.xyz"

# tragen Sie hier so viele Identitäten ein,
# wie Sie benötigen:
@{
  ErsteIdentitaet = Get-Credential
  ZweiteIdentitaet = Get-Credential
} | Export-Clixml -Path $Path
