function Export-Credential($cred, $file) {
  $ergebnis = 1 | Select-Object Username, Password
  $ergebnis.Username = $cred.UserName
  $ergebnis.Password = $cred.Password | ConvertFrom-SecureString
  $ergebnis | Export-Clixml $file
}

function Import-Credential($file) {
  $ergebnis = Import-Clixml $file
  $user = $ergebnis.username
  $password = $ergebnis.password | ConvertTo-SecureString 
  New-Object system.Management.Automation.PSCredential($user, $password)
}
