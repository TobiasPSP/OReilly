#requires -Version 2.0 -Modules ScheduledTasks

$taskName = "Update PowerShell Module"
$description = "Überprüft und aktualisiert PowerShell-Module"

# was soll geschehen?
$taskAction = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-noprofile -executionpolicy bypass -file c:\autostartskripte\updatemodules.ps1'
# wann soll es geschehen?
$taskTrigger = New-ScheduledTaskTrigger -AtLogOn -User $env:username

# Aufgabe registrieren:
Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $taskTrigger -Description $description
