$username = 'firma\Hans'
$password = 'topSecret99' | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object -TypeName PSCredential($username, $password)

Get-WmiObject -Class Win32_BIOS -ComputerName RemoteServerABC -Credential $credential
