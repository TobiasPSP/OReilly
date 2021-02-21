$Path = 'c:\testumgebung\abteilung1\testing\Benutzerkonten'
$Path -split '\\' -notlike 'test*' -join '\'
