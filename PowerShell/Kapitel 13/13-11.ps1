class SuperProcess : System.Diagnostics.Process
{    
    
  # Konstruktor (wird beim Anlegen einer Instanz dieser Klasse aufgerufen)
  SuperProcess([string]$Name) : base()
  {
    
    $this.StartInfo.FileName = $Name
    $this.Start()
    
    # warten, bis die Anwendung vollständig gestartet ist
    $this.WaitForInputIdle()
  }

  [void]Close([Int]$Timeout = 0) 
  {
    # Aufforderung zum Schließen senden:
    $this.CloseMainWindow()
    
    # Auf Erfolg warten:
    if ($Timeout -gt 0)
    {
      $null = $this.WaitForExit($Timeout * 1000)
    }
    
    # falls Prozess immer noch läuft, sofort beenden
    if ($this.HasExited -eq $false)
    {
      $this.Kill()
    }
  }
  
  static [System.Diagnostics.Process[]] GetAllProcesses()
  {
    return [SuperProcess]::GetAllProcesses($false)
  }
  static [System.Diagnostics.Process[]] GetAllProcesses([bool]$All)
  {
    if ($All)
    {
      return Get-Process
    }
    else
    {
      return Get-Process | Where-Object { $_.MainWindowHandle -ne 0 }
    }
  }
}
