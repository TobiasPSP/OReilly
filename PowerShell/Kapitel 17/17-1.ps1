filter Get-ErrorDetail
{
    $Category = @{
        Name = 'Category'
        Expression = { $_.CategoryInfo.Category }
    }

    $Exception = @{
        Name = 'Exception'
        Expression = { $_.Exception.Message }
    }

    $LineNumber = @{
        Name = 'Line'
        Expression = { $_.InvocationInfo.ScriptLineNumber }
    }

    $ScriptName = @{
        Name = 'Script'
        Expression = { $_.InvocationInfo.ScriptName }
    }

    $Target = @{
        Name = 'Target'
        Expression = { $_.TargetObject }
    }

    $ErrorID = @{
        Name = 'ErrorID'
        Expression = { $_.FullyQualifiedErrorID }
    }

    $Input |
      Select-Object $Category, $Exception, $LineNumber, $ScriptName, $Target, $ErrorID
}
