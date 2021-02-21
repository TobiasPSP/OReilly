# Logdatei hier speichern:
$Path = "$env:temp\logfile.csv"

# Inhalt des Windows-Ordners...
Get-ChildItem -Path c:\windows |
    # ...mit diesen Eigenschaften... 
    Select-Object -Property LastWriteTime, Name, Extension, Length, FullName |
    # als CSV-Datei speichern
    Export-Csv -Path $Path -NoTypeInformation -Encoding UTF8

# Ergebnis im notepad-Editor anzeigen:
notepad $Path
