try
{
  New-Item -Path c:\neuerordner -Type Directory
  'Erfolgreich angelegt.'
}
catch
{
  "Fehler aufgetreten: $_"
}
