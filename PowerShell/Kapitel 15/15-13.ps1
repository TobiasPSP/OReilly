function New-User
{
    param
    (
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [string]
        $Name,

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [string]
        $Vorname,

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [int]
        $ID
    )

    process
    {
        "Hier könnte der User $Vorname $Name mit der ID $ID angelegt werden."
    }
}
