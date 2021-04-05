class Person
{
    [string]$Name
    [datetime]$Datum
    [int]$Id

    # parameterloser Konstruktor:
    Person()
    {
        $this.Name = 'Unbekannt'
        $this.Datum = Get-Date
        $this.Id = -1
    }

    # alle Informationen selbst festlegen:
    Person([string]$Name, [datetime]$Datum, [int]$Id)
    {
        $this.Name = $Name
        $this.Datum = $Datum
        $this.Id = $Id
    }

    # Defaultwerte für manche Informationen:
    Person([string]$Name, [datetime]$Datum)
    {
        $this.Name = $Name
        $this.Datum = $Datum
        $this.Id = -1
    }

    # Defaultwerte für manche Informationen:
    Person([string]$Name, [int]$Id)
    {
        $this.Name = $Name
        $this.Datum = Get-Date
        $this.Id = -1
    }

    [Timespan]GetEmploymentTime()
    {
        $heute = Get-Date
        $zeitraum = $heute - $this.Datum
        return $zeitraum
    }
}
