function Watch-Service
{
  begin 
  { 
    $start = Get-Date 
  } 
  
  process 
  { 
    if ($_.Status -eq 'Running') 
    { Write-Host $_.DisplayName -ForegroundColor Green } 
    else 
    { Write-Host $_.DisplayName -ForegroundColor Red }
  } 
  
  end 
  { 
    $ende = Get-Date
    $dauer = $ende - $start
    $millisec = $dauer.TotalMilliSeconds
    Write-Warning "Ausführungszeit: $millisec ms" 
  }
}
