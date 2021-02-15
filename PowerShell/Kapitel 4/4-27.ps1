[xml]$xml = @'
<QueryList><Query Id="0" Path="system"><Select Path="system">*[(System/TimeCreated[@SystemTime&gt;='2021-02-14T12:09:46.000Z']) and ((System/Level=1) or (System/Level=2) or (System/Level=3))]</Select></Query></QueryList>
'@

Get-WinEvent -FilterXml $xml
