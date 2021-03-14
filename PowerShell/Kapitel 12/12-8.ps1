$code = {
    # Objektbeschreibung bei Microsoft anzeigen:
    $url = 'https://docs.microsoft.com/en-us/dotnet/api/{0}' -f $this.GetType().FullName
    # im Standard-Browser öffnen:
    Start-Process $url
}

# Code als neuen Befehl Help() für alle Objekte vom Typ "System.Object" anzeigen:
Update-TypeData -MemberType ScriptMethod -MemberName Help -Value $code -TypeName System.Object -Force
