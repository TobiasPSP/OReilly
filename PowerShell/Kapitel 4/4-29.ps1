$testobjekt = [PSCustomObject]@{
    Date = '2020-10-12'
    Name = 'Test'
    Id   = 100
}

# Objekt enthält eine Eigenschaft namens Date
# mit einem gültigen Datum
$testobjekt | Out-GridView

# Objekt kann deshalb direkt an Get-Date weitergeleitet werden
$testobjekt | Get-Date
