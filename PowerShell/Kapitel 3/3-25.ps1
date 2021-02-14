param
(
    # zwingender Parameter für den Euro-Betrag:
    [double]
    [Parameter(Mandatory)]
    $Eurobetrag,

    # optionaler Parameter für den Wechselkurs mit
    # einem Defaultwert:
    [double]
    $Wechselkurs = 1.13
)

$Eurobetrag * $Wechselkurs
