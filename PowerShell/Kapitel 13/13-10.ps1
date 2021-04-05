class Programmierer : Person
{
    [string[]]$Programmiersprache

    Programmierer() 
    : base()
    {
        $this.Programmiersprache = "keine"
    }

    Programmierer([string]$Name, [datetime]$Datum, [int]$Id, [string[]]$Sprachen) 
    : base($Name, $Datum, $id)
    {
        $this.Programmiersprache = $Sprachen
    }
}
