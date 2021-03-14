do { 
    $ip = Read-Host -Prompt 'IPv4'
} until ($ip -like '*.*.*.*' -and $ip -as [Net.IPAddress])
