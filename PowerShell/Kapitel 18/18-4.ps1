function Get-ErrorEvent
{
  param
  (
    [Parameter(Mandatory=$true)]
    $ComputerName,

    $LogName='System'
  )

     $code =
     {
       param($LogName)

       Get-EventLog -LogName $LogName -EntryType Error |
         Export-Csv $env:TEMP\result.csv -NoTypeInformation -Encoding UTF8 -UseCulture
     }

  Invoke-Command -ScriptBlock $code -ComputerName $ComputerName -ArgumentList $LogName
}
