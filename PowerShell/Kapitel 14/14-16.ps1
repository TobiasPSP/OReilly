function Test-Binding {
  [CmdletBinding(DefaultParameterSetName='Name')]
  param(
    [Parameter(ParameterSetName='ID', Position=0, Mandatory=$true)][int]$ID,
    [Parameter(ParameterSetName='Name', Position=0, Mandatory=$true)][string]$Name
  )

  $set = $PSCmdlet.ParameterSetName
  "Sie haben ParameterSet $set gewählt."

  if ($set -eq 'ID') {
    "Die ID ist $ID"
  } else {
    "Der Name lautet $Name"
  }
}
