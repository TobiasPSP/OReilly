  [CmdletBinding(SupportsShouldProcess)]
  param
  (
    [Parameter(Mandatory,HelpMessage='Geben Sie die Listingnummer im Format X.Y ein, z.B. 1.2')]
    [string]
    $Id,

    [Switch]
    $Run
  )
    
  $ConfirmPreference = $false
    
  $AllProtocols = [System.Net.SecurityProtocolType]'Tls12' 
  [System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols
    
  try
  {
    $parts = $id.Split('.')
    if ($parts.Count -ne 2) { throw "Invalid" }
    $id1= [int]$parts[0]
    $id2= [int]$parts[1]
    if (($id1 -lt 1) -or ($id1 -gt 20)) { throw "Invalid" }
    if (($id2 -lt 1) -or ($id2 -gt 100)) { throw "Invalid" }
  }
  catch
  {
    Write-Warning "'$id' wurde im falschen Format angegeben."
    return    
  }
    
  $code = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/TobiasPSP/OReilly/main/PowerShell/Kapitel%20$id1/$id1-$id2.ps1"
    
  if ($Run) 
  { 
    Write-Host "Listing $id1.${id2}:"
    [ScriptBlock]$sb = [ScriptBlock]::Create($code.Trim())
    $sb
    if ($PSCmdlet.ShouldProcess("Führt das Skript $id1.$id2 aus dem Buch aus.",'Drücken Sie "A" um den Code jetzt auszuführen, oder "N" um abzubrechen.', "Führen Sie nur Code aus, den Sie verstanden haben und von dem Sie genau wissen, was er auslösen wird!"))
    {
      $sb.Invoke()
    }
  }
  else
  {
    $code.Trim() | Set-ClipBoard
    if ($host.Name -eq 'Windows PowerShell ISE Host')
    {
      $file = $psISE.CurrentPowerShellTab.Files.Add()
      $file.Editor.Text = $code.Trim()
      $file.Editor.SetCaretPosition(1,1)
    }
    else 
    {
      Write-Host "Listing $id1.$id2 liegt in der Zwischenablage. Fügen Sie es mit STRG+V in Ihre Konsole oder Editor ein."
    }
  }
