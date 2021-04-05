$person = [PSCustomObject]@{
    Name = $env:username
    Datum = Get-Date
    Id = 12
}

$person
