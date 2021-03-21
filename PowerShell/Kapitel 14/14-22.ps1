function Test-ParameterStatic
{
    param
    (
        [Parameter(Mandatory=$true)]
        [Int]
        $ID,

        [Parameter(Mandatory=$false)]
        [String]
        [ValidateSet('NewYork','Cork','Hannover')]
        $City='Hannover'
    )

    "ID ist $ID und Stadt ist $City"
}
