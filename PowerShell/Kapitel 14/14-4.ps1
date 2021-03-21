$enum = '
using System;

public enum Level
{
    Beginner,
    Advanced,
    Professional,
    GodlikeBeing
}
'
Add-Type -TypeDefinition $enum
