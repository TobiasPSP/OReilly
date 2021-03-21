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
    if ($Dienst.Status -eq 'Running') 
    { Write-Host $Dienst.DisplayName -ForegroundColor Green } 
    else 
    { Write-Host $Dienst.DisplayName -ForegroundColor Red }
  } 
  
  end 
  { 
    $ende = Get-Date
    $dauer = $ende - $start
    $millisec = $dauer.TotalMilliSeconds
    Write-Warning "Ausführungszeit: $millisec ms" 
  }
}
