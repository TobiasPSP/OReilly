class Person
{
    [string]$Name
    [datetime]$Datum
    [int]$Id

    Person([string]$Name, [datetime]$Datum, [int]$Id)
    {
        $this.Name = $Name
        $this.Datum = $Datum
        $this.Id = $Id
    }
}
