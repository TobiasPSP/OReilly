function Watch-Service
{
  param
  (
    [Parameter(ValueFromPipeline=$true)]
    $Dienst
  )

  begin 
  { 
    $start = Get-Date 
  } 
  
  process 
  { 
    foreach($Einzeldienst in $Dienst)
    {
      if ($Einzeldienst.Status -eq 'Running') 
      { Write-Host $Einzeldienst.DisplayName -ForegroundColor Green } 
      else 
      { Write-Host $Einzeldienst.DisplayName -ForegroundColor Red }
    }
  } 
  
  end 
  { 
    $ende = Get-Date
    $dauer = $ende - $start
    $millisec = $dauer.TotalMilliSeconds
    Write-Warning "Ausführungszeit: $millisec ms" 
  }
}
