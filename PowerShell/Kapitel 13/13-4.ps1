$person = [Person]::new()

$person.Name = $env:username
$person.Datum = Get-Date
$person.Id = 12

$person
