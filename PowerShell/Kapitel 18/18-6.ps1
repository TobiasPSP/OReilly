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

       Get-EventLog -LogName $LogName -EntryType Error
     }

  Invoke-Command -ScriptBlock $code -ComputerName $ComputerName -ArgumentList $LogName |
         Export-Csv $env:temp\result.csv -NoTypeInformation -Encoding UTF8 -UseCulture
}
