$typ = [System.ConsoleColor]
$names = $typ.GetEnumNames()
$valuetype = $typ.GetEnumUnderlyingType()

$names | ForEach-Object {
    $result = New-Object PSObject | Select-Object -Property Name, Value
    $result.Name = $_
    $result.Value = [System.Enum]::Parse($typ, $_) -as $valuetype
    $result
} | Format-Table -AutoSize
