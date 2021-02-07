$music = '440-500,440-500,440-500,349-350,523-150,440-500,349-350,523-150,440-1000,659-500,659-500,659-500,698-350,523-150,415-500,349-350,523-150,440-1000'

$music.Split(',') |
  ForEach-Object {
    $frequency, $duration = $_.Split('-')
    [Console]::Beep($frequency, $duration) 
    Write-Host $_
}
