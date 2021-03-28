try
{
  New-Item -Path c:\neuerordner -Type Directory -ErrorAction Stop
  'Erfolgreich angelegt.'
}
catch
{
  "Fehler aufgetreten: $_"
}
