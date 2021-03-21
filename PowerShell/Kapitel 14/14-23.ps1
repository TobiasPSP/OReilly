$Parameter = [Management.Automation.RuntimeDefinedParameter]::new('City',[String], $ListeAttribute)
    $Eimer.Add('City', $Parameter)

    # die beiden dynamischen Parameter zurückgeben:
    $Eimer
  }

  end
  {
    # Inhalt der dynamischen Parameter findet sich in $PSBoundParameters
    $Id = $PSBoundParameters['ID']
    $City = $PSBoundParameters['City']
    "ID ist $Id und Stadt ist $City"
  }
}
