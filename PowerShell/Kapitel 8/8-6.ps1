$message = (Test-Path -Path c:\temp) ? "TEMP existiert" : "TEMP nicht vorhanden"
"Status: $message"
