Register-ArgumentCompleter -Command Get-WinEvent -ParameterName LogName -ScriptBlock {
          # der Skriptblock, der die dynamischen Vorschläge generiert,
          # erhält selbst ebenfalls Argumente, mit denen er die 
          # Vorschlagslisten auf bereits getätigte Eingaben anpassen kann:
          param
          (
            $commandName,         # Name des Befehls, der den Parameter verwendet
            $parameterName,       # Name des Parameters
            $wordToComplete,      # WICHTIG: bereits eingegebenes Argument
            $commandAst,          # Zugang zum Abstract Syntax Tree 
            $fakeBoundParameters  # WICHTIG: andere angegebene Parameter
          )
        
          # HIER werden die Einträge der Vorschlagsliste generiert:
          
          Get-WinEvent -ListLog * -ErrorAction Ignore | 
          # nur Eventlogs mit Inhalt:
          Where-Object RecordCount -gt 0 |
          # nur Eventlogs, deren Namen den bereits eingegebenen Namen enthalten:
          Where-Object LogName -like "*$wordToComplete*" |
          # sortieren:
          Sort-Object -Property LogName |
          # für jedes Eventlog einen Eintrag im Vervollständigungsmenü erzeugen:
          Foreach-Object {
            $listItemText = $_.LogName
            $completionText = "'$listItemText'"
            $count = $_.RecordCount
            $toolTip = "$listItemText`r`n($count)"
            [System.Management.Automation.CompletionResult]::new(
               $completionText, $listItemText,"ParameterValue", $toolTip)
          }
        
    })]
    [string]
    $LogName
  )

  # den eingegebenen Namen weiterleiten:
  Get-WinEvent -LogName $LogName 
}
