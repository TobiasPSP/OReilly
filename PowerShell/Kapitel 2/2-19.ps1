# Noten in Frequenzen übersetzen:
$scale = @{
    D4b=297
    D4=293
    E4=329
    F4=349
    A4b=415
    A4=440
    B4b=466
    B4=493
    C4=523
    D5=587
    D5b=554
    E5b=622
    E5=659
    F5=698
    G5b=739
    G5=783
    A5b=830
    A5=880
}

$imperialmarch = 'A4-4,A4-4,A4-4,F4-8,C4-8,A4-4,F4-8,C4-8,A4-2,E5-4,E5-4,E5-4,F5-8,C4-8,A4b-4,F4-8,C4-8,A4-2,A5-4,A4-8,A4-8,A5-4,A5b-8,G5-8,G5b-8,F5-8,G5b-8,B4b-8,E5b-4,D5-8,D5b-8,C4-8,B4-8,C4-8,F4-8,A4b-4,F4-8,A4-8,C4-4,A4-8,C4-8,E5-2,A5-4,A4-8,A4-8,A5-4,A5b-8,G5-8,G5b-8,F5-8,G5b-8,B4b-8,E5b-4,D5-8,D5b-8,C4-8,B4-8,C4-8,F4-8,A4b-4,F4-8,C4-8,A4-4,F4-8,C4-8,A4-4,F4-8,C4-8,A4-2'

# Länge einer ganzen Note in Millisekunden:
$fullLength = 2000

$imperialmarch.Split(',') |
  ForEach-Object {
    $note, $duration = $_.Split('-')
    [Console]::Beep($scale[$note], ($fullLength/$duration))
    Write-Host $_
    # einen kurzen Schlafbefehl einsetzen, damit die Tonausgabe synchron bleibt
    # (technisches Detail des Beep()-Befehls, der leicht überfordert warden kann)
    Start-Sleep -MilliSeconds 200
  }
