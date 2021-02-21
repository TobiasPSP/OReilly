$Path = "$env:temp\Updates.txt"

$filter = @{ 
    ProviderName="Microsoft-Windows-WindowsUpdateClient"
    Id=19 
}

# Liste der installierten Updates ermitteln...
Get-WinEvent -FilterHashtable $filter | 
    # ...als Tabelle mit optimaler Spaltenbreite formatieren, und wenn
    # der Platz nicht reicht, den Rest nicht abschneiden, sondern
    # umbrechen (Wrap)
    Format-Table -AutoSize -Wrap |
    # ...und in eine Textdatei schreiben, die maximal 120
    # Zeichen breit sein soll
    Out-File -FilePath $Path -Width 120

# Dateiinhalt in einem Editor öffnen
Notepad $Path
