class SecureStringTransformAttribute 
: System.Management.Automation.ArgumentTransformationAttribute
{
    [object] Transform([System.Management.Automation.EngineIntrinsics]$engineIntrinsics,
 [object] $inputData)
    {
        # if a securestring was submitted...
        if ($inputData -is [SecureString])
        {
            # return as-is:
            return $inputData
        }
        # if the argument is a string...
        elseif ($inputData -is [string])
        {
            # convert to secure string:
            return $inputData | ConvertTo-SecureString -AsPlainText -Force
        }
        
        # anything else throws an exception:
        throw [System.InvalidOperationException]::new('Unexpected error.')
    }
}

class StringTransformAttribute 
: System.Management.Automation.ArgumentTransformationAttribute
{
    [object] Transform([System.Management.Automation.EngineIntrinsics]$engineIntrinsics,
       [object] $inputData)
    {
        # if a string was submitted...
        if ($inputData -is [string])
        {
            # return as-is:
            return $inputData
        }
        # if the argument is a securestring...
        elseif ($inputData -is [securestring] -and $inputData.Length -gt 0)
        {
            $BSTR =
              [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($inputData)
            $PlainPassword =
              [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
            [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR) 
            return $PlainPassword
        }
        Else
        {
            return ''
        }
        
        # anything else throws an exception:
        throw [System.InvalidOperationException]::new('Unexpected error.')
    }
}


function Get-Secret
{
    Param
    (
        [Parameter(Mandatory)]
        [SecureString]
        [SecureStringTransform()]
        $geheim
    )

    [string][StringTransform()]$plain = $geheim
    "You entered: $plain"
}

Get-Secret
