$hashtable = Get-ChildItem -Path $env:windir -File | 
  Group-Object -Property { if($_.Length -gt 100KB) { 'gross' } else { 'klein' }} -AsHashTable -AsString


$hashtable.klein
