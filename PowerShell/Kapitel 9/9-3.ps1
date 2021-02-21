# löst nur die Variable $host auf und fügt
# dahinter '.Version' an:
"PowerShell-Version: $host.Version"

# richtig:
"PowerShell-Version: $($host.Version)"

# auch direkte Befehle sind möglich:
"Heute ist $(Get-Date -Format dddd)"
