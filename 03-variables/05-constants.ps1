<#
.SYNOPSIS
    PowerShell Constants Reference

.DESCRIPTION
    This file explains how to create and use constants
    and read-only variables in PowerShell.

    PowerShell does not have a traditional "const" keyword.

    Instead, PowerShell provides variable options such as:

        Constant
        ReadOnly

    Important commands:

        Set-Variable
        Get-Variable
        Remove-Variable

    Scope modifiers can also be used:

        $local:
        $script:
        $global:

.NOTES
    Constant variables cannot be changed or removed during
    the current PowerShell session.

    ReadOnly variables can be changed or removed by using
    -Force.
#>


# ============================================================
# 1. DOES POWERSHELL HAVE CONST?
# ============================================================
<#
    PowerShell does NOT have a keyword such as:

        const

    You cannot normally write:

        const PI = 3.14

    Instead, use:

        Set-Variable -Option Constant
#>


# ============================================================
# 2. BASIC CONSTANT
# ============================================================
<#
    Create a constant using Set-Variable.
#>

Set-Variable -Name Pi -Value 3.141592653589793 -Option Constant

Write-Host "Pi = $Pi"


# ============================================================
# 3. CONSTANT USING Get-Variable
# ============================================================
<#
    Get-Variable can be used to inspect the variable.

    The Options property shows whether the variable is
    Constant, ReadOnly, etc.
#>

Get-Variable -Name Pi

Write-Host "Name    : $((Get-Variable -Name Pi).Name)"
Write-Host "Value   : $((Get-Variable -Name Pi).Value)"
Write-Host "Options : $((Get-Variable -Name Pi).Options)"


# ============================================================
# 4. TRY TO CHANGE A CONSTANT
# ============================================================
<#
    A constant cannot be changed.

    The following command intentionally generates an error.

    This is included as a demonstration.
#>

try {
    $Pi = 3.14
}
catch {
    Write-Host "Cannot modify a constant."
}


# ============================================================
# 5. CONSTANT CANNOT BE REMOVED
# ============================================================
<#
    A constant cannot normally be removed.
#>

try {
    Remove-Variable -Name Pi -ErrorAction Stop
}
catch {
    Write-Host "Cannot remove the Pi constant."
}


# ============================================================
# 6. READONLY VARIABLE
# ============================================================
<#
    ReadOnly is different from Constant.

    A ReadOnly variable cannot normally be changed or removed.

    However, it can be changed using -Force.
#>

Set-Variable -Name ApplicationName `
    -Value "PowerShell Automation" `
    -Option ReadOnly

Write-Host "Application: $ApplicationName"


# ============================================================
# 7. CHANGE READONLY WITH -FORCE
# ============================================================
<#
    ReadOnly variables can be modified using Set-Variable
    with -Force.
#>

Set-Variable -Name ApplicationName `
    -Value "PowerShell Administration" `
    -Force

Write-Host "Application: $ApplicationName"


# ============================================================
# 8. REMOVE READONLY WITH -FORCE
# ============================================================
<#
    A ReadOnly variable can also be removed using -Force.

    We create another ReadOnly variable for demonstration.
#>

Set-Variable -Name TemporaryReadOnly `
    -Value "Temporary Value" `
    -Option ReadOnly

Write-Host "Before removal: $TemporaryReadOnly"

Remove-Variable -Name TemporaryReadOnly -Force

Write-Host "ReadOnly variable removed."


# ============================================================
# 9. CONSTANT VS READONLY
# ============================================================
<#
    CONSTANT

        Cannot be changed normally.
        Cannot be removed.
        -Force cannot be used to modify/remove it.

    READONLY

        Cannot be changed normally.
        Cannot be removed normally.
        Can be changed with -Force.
        Can be removed with -Force.

    Therefore:

        Constant = stronger protection
        ReadOnly  = protection that can be overridden
#>


# ============================================================
# 10. CONSTANT STRING
# ============================================================
<#
    Constants can contain strings.
#>

Set-Variable -Name CompanyName `
    -Value "Example Corporation" `
    -Option Constant

Write-Host "Company: $CompanyName"


# ============================================================
# 11. CONSTANT INTEGER
# ============================================================
<#
    Constants can contain numbers.
#>

Set-Variable -Name MaxRetries `
    -Value 5 `
    -Option Constant

Write-Host "Maximum retries: $MaxRetries"


# ============================================================
# 12. CONSTANT BOOLEAN
# ============================================================
<#
    Constants can contain Boolean values.
#>

Set-Variable -Name IsProduction `
    -Value $true `
    -Option Constant

Write-Host "Production: $IsProduction"


# ============================================================
# 13. CONSTANT ARRAY
# ============================================================
<#
    A constant variable prevents the variable itself from
    being reassigned.

    Important:
    The collection stored inside the variable may still be
    mutable depending on its type.

    Constant protects the variable binding, not necessarily
    every object stored inside it.
#>

Set-Variable -Name SupportedEnvironments `
    -Value @(
        "Development"
        "Testing"
        "Production"
    ) `
    -Option Constant

Write-Host "Supported environments:"
$SupportedEnvironments


# ============================================================
# 14. CONSTANT HASHTABLE
# ============================================================
<#
    The same concept applies to a hashtable.

    The variable cannot be reassigned, but the hashtable
    object itself can potentially be modified.
#>

Set-Variable -Name Configuration `
    -Value @{
        Server = "SERVER01"
        Port   = 443
    } `
    -Option Constant

Write-Host "Server: $($Configuration.Server)"
Write-Host "Port  : $($Configuration.Port)"


# ============================================================
# 15. CONSTANT DOES NOT MAKE OBJECT IMMUTABLE
# ============================================================
<#
    This is an important concept.

    The variable Configuration is constant.

    But the hashtable object stored in it can still be
    modified.
#>

$Configuration.Server = "SERVER02"

Write-Host "Server after object modification: $($Configuration.Server)"


# ============================================================
# 16. REASSIGNING CONSTANT OBJECT
# ============================================================
<#
    Reassigning the constant variable itself is not allowed.

    Example:

        $Configuration = @{}

    This would fail because Configuration is constant.
#>

try {
    $Configuration = @{}
}
catch {
    Write-Host "Cannot reassign a constant variable."
}


# ============================================================
# 17. SCRIPT-SCOPE CONSTANT
# ============================================================
<#
    Constants can be explicitly created in script scope.

    This is useful when multiple functions in the script
    need to use the same constant.
#>

Set-Variable -Name ApplicationVersion `
    -Value "1.0.0" `
    -Option Constant `
    -Scope Script

Write-Host "Application Version: $script:ApplicationVersion"


# ============================================================
# 18. GLOBAL CONSTANT
# ============================================================
<#
    A constant can also be created in global scope.

    Be careful with global variables/constants because they
    affect the PowerShell session.
#>

Set-Variable -Name GlobalCompanyName `
    -Value "Global Example Corporation" `
    -Option Constant `
    -Scope Global

Write-Host "Global Company: $global:GlobalCompanyName"


# ============================================================
# 19. ACCESS SCRIPT CONSTANT FROM FUNCTION
# ============================================================
<#
    A function can access a script-scoped constant.
#>

Set-Variable -Name ScriptApiVersion `
    -Value "v2" `
    -Option Constant `
    -Scope Script

function Show-ApiVersion {

    Write-Host "API Version: $script:ScriptApiVersion"
}

Show-ApiVersion


# ============================================================
# 20. ACCESS GLOBAL CONSTANT FROM FUNCTION
# ============================================================
<#
    A function can access a global constant.
#>

Set-Variable -Name GlobalApiVersion `
    -Value "v3" `
    -Option Constant `
    -Scope Global

function Show-GlobalApiVersion {

    Write-Host "Global API Version: $global:GlobalApiVersion"
}

Show-GlobalApiVersion


# ============================================================
# 21. CONSTANT INSIDE FUNCTION
# ============================================================
<#
    A constant created inside a function belongs to that
    function's local scope.
#>

function Show-LocalConstant {

    Set-Variable -Name LocalConstant `
        -Value "Function Constant" `
        -Option Constant

    Write-Host "Inside function: $LocalConstant"
}

Show-LocalConstant


# ============================================================
# 22. LOCAL CONSTANT IS NOT GLOBAL
# ============================================================
<#
    A constant created inside a function is not automatically
    available outside that function.
#>

function Create-LocalConstant {

    Set-Variable -Name FunctionConstant `
        -Value "Only inside function" `
        -Option Constant

    Write-Host "Inside: $FunctionConstant"
}

Create-LocalConstant

Write-Host "Outside function:"
Write-Host $FunctionConstant


# ============================================================
# 23. SET-VARIABLE -OPTION CONSTANT
# ============================================================
<#
    The general syntax is:

        Set-Variable
            -Name <name>
            -Value <value>
            -Option Constant
#>

Set-Variable `
    -Name DatabasePort `
    -Value 1433 `
    -Option Constant

Write-Host "Database Port: $DatabasePort"


# ============================================================
# 24. GET-VARIABLE OPTIONS
# ============================================================
<#
    You can inspect a variable's options.
#>

$variableInfo = Get-Variable -Name DatabasePort

Write-Host "Name    : $($variableInfo.Name)"
Write-Host "Value   : $($variableInfo.Value)"
Write-Host "Options : $($variableInfo.Options)"


# ============================================================
# 25. CHECK WHETHER VARIABLE IS CONSTANT
# ============================================================
<#
    You can check the Options property.
#>

$piInfo = Get-Variable -Name Pi

if ($piInfo.Options -band [System.Management.Automation.ScopedItemOptions]::Constant) {
    Write-Host "Pi is a constant."
}


# ============================================================
# 26. CHECK WHETHER VARIABLE IS READONLY
# ============================================================
<#
    ReadOnly variables have the ReadOnly option.
#>

$applicationInfo = Get-Variable -Name ApplicationName

if ($applicationInfo.Options -band [System.Management.Automation.ScopedItemOptions]::ReadOnly) {
    Write-Host "ApplicationName is ReadOnly."
}


# ============================================================
# 27. CONSTANT WITH DATETIME
# ============================================================
<#
    Constants can contain DateTime objects.
#>

Set-Variable -Name ReleaseDate `
    -Value ([datetime]"2026-01-01") `
    -Option Constant

Write-Host "Release Date: $ReleaseDate"


# ============================================================
# 28. CONSTANT WITH ENUM
# ============================================================
<#
    Constants can store .NET objects as values.

    Example using StringComparison.
#>

Set-Variable -Name ComparisonMode `
    -Value ([System.StringComparison]::OrdinalIgnoreCase) `
    -Option Constant

Write-Host "Comparison Mode: $ComparisonMode"


# ============================================================
# 29. CONSTANT WITH CALCULATED VALUE
# ============================================================
<#
    The value can be calculated when the constant is created.

    Once created, the variable cannot be reassigned.
#>

Set-Variable -Name SecondsPerDay `
    -Value (24 * 60 * 60) `
    -Option Constant

Write-Host "Seconds per day: $SecondsPerDay"


# ============================================================
# 30. CONSTANTS FOR SCRIPT CONFIGURATION
# ============================================================
<#
    Constants are useful for values that should never change
    while the script is running.

    Examples:

        API version
        Fixed retry count
        Protocol name
        File extension
        Mathematical values
        Application identifiers
#>

Set-Variable -Name ApiVersion `
    -Value "v1" `
    -Option Constant `
    -Scope Script

Set-Variable -Name MaxRetryCount `
    -Value 3 `
    -Option Constant `
    -Scope Script

Set-Variable -Name ConfigFileExtension `
    -Value ".json" `
    -Option Constant `
    -Scope Script

Write-Host "API Version       : $script:ApiVersion"
Write-Host "Max Retry Count   : $script:MaxRetryCount"
Write-Host "Config Extension  : $script:ConfigFileExtension"


# ============================================================
# 31. CONSTANTS IN A FUNCTION
# ============================================================
<#
    A function can use a script-scoped constant without
    modifying it.
#>

Set-Variable -Name DefaultTimeout `
    -Value 30 `
    -Option Constant `
    -Scope Script

function Invoke-Application {

    Write-Host "Timeout: $script:DefaultTimeout seconds"
}

Invoke-Application


# ============================================================
# 32. CONSTANT VS NORMAL VARIABLE
# ============================================================
<#
    NORMAL VARIABLE

        $Name = "John"

        Can be changed:

        $Name = "Peter"


    CONSTANT

        Set-Variable -Name Name `
            -Value "John" `
            -Option Constant

        Cannot be reassigned.
#>

$NormalName = "John"

Write-Host "Normal variable: $NormalName"

$NormalName = "Peter"

Write-Host "Changed variable: $NormalName"


# ============================================================
# 33. READONLY VS CONSTANT
# ============================================================
<#
    Example comparison:

        Constant:

            Set-Variable -Option Constant

            Cannot modify with -Force.


        ReadOnly:

            Set-Variable -Option ReadOnly

            Can modify with -Force.
#>

Set-Variable -Name ConstantValue `
    -Value "Cannot Change" `
    -Option Constant

Set-Variable -Name ReadOnlyValue `
    -Value "Can Force Change" `
    -Option ReadOnly

Write-Host "Constant : $ConstantValue"
Write-Host "ReadOnly : $ReadOnlyValue"


# ============================================================
# 34. READONLY FORCE EXAMPLE
# ============================================================
<#
    Demonstrates the difference between ReadOnly and Constant.
#>

Set-Variable -Name ForceExample `
    -Value "Original" `
    -Option ReadOnly

Write-Host "Before: $ForceExample"

Set-Variable -Name ForceExample `
    -Value "Changed using Force" `
    -Force

Write-Host "After: $ForceExample"

Remove-Variable -Name ForceExample -Force


# ============================================================
# 35. CONSTANT CANNOT USE FORCE TO CHANGE
# ============================================================
<#
    Even -Force cannot change a true Constant variable.
#>

Set-Variable -Name PermanentValue `
    -Value "Permanent" `
    -Option Constant

try {

    Set-Variable -Name PermanentValue `
        -Value "New Value" `
        -Force `
        -ErrorAction Stop

}
catch {

    Write-Host "Constant could not be changed, even with -Force."
}


# ============================================================
# 36. CONSTANT AND SCOPE
# ============================================================
<#
    Constant and scope are separate concepts.

    Option:

        Constant

    determines whether the variable can be changed.

    Scope:

        Local
        Script
        Global

    determines where the variable exists.
#>

Set-Variable -Name LocalConstant `
    -Value "Local Constant" `
    -Option Constant `
    -Scope Local

Set-Variable -Name ScriptConstant `
    -Value "Script Constant" `
    -Option Constant `
    -Scope Script

Set-Variable -Name GlobalConstant `
    -Value "Global Constant" `
    -Option Constant `
    -Scope Global


# ============================================================
# 37. CONSTANT WITH FUNCTION
# ============================================================

Set-Variable -Name Organization `
    -Value "Example Organization" `
    -Option Constant `
    -Scope Script

function Get-Organization {

    return $script:Organization
}

$organizationResult = Get-Organization

Write-Host "Organization: $organizationResult"


# ============================================================
# 38. CONSTANT FOR FILE PATH
# ============================================================
<#
    Constants can be used for fixed values used throughout
    a script.
#>

Set-Variable -Name LogExtension `
    -Value ".log" `
    -Option Constant `
    -Scope Script

Write-Host "Log extension: $script:LogExtension"


# ============================================================
# 39. CONSTANT FOR REGEX
# ============================================================
<#
    A regular expression can be stored in a constant.

    The variable cannot be reassigned.
#>

Set-Variable -Name EmailRegex `
    -Value '^[^@\s]+@[^@\s]+\.[^@\s]+$' `
    -Option Constant `
    -Scope Script

$email = "user@example.com"

if ($email -match $script:EmailRegex) {
    Write-Host "Valid email format"
}


# ============================================================
# 40. CONSTANT FOR EXIT CODES
# ============================================================
<#
    Fixed exit codes can be represented as constants.
#>

Set-Variable -Name ExitSuccess `
    -Value 0 `
    -Option Constant `
    -Scope Script

Set-Variable -Name ExitFailure `
    -Value 1 `
    -Option Constant `
    -Scope Script

Write-Host "Success code: $script:ExitSuccess"
Write-Host "Failure code: $script:ExitFailure"


# ============================================================
# 41. LIST ALL CONSTANT VARIABLES
# ============================================================
<#
    Get-Variable can be filtered using the Options property.
#>

Get-Variable |
    Where-Object {
        $_.Options -band [System.Management.Automation.ScopedItemOptions]::Constant
    }


# ============================================================
# 42. LIST ALL READONLY VARIABLES
# ============================================================
<#
    Display variables marked as ReadOnly.
#>

Get-Variable |
    Where-Object {
        $_.Options -band [System.Management.Automation.ScopedItemOptions]::ReadOnly
    }


# ============================================================
# 43. CONSTANT NAMING CONVENTION
# ============================================================
<#
    PowerShell does not require constants to use uppercase names.

    These are all valid:

        $MaxRetries
        $MAX_RETRIES
        $maxRetries

    A common convention is to use descriptive PascalCase names:

        $MaxRetryCount
        $DefaultTimeout
        $ApiVersion
#>

Set-Variable -Name DefaultTimeoutSeconds `
    -Value 30 `
    -Option Constant

Write-Host "Default timeout: $DefaultTimeoutSeconds"


# ============================================================
# 44. COMMON MISTAKE - EXPECTING CONST KEYWORD
# ============================================================
<#
    This is NOT valid PowerShell syntax:

        const PI = 3.14

    Use:

        Set-Variable -Name Pi -Value 3.14 -Option Constant
#>


# ============================================================
# 45. COMMON MISTAKE - THINKING READONLY IS CONSTANT
# ============================================================
<#
    ReadOnly is NOT the same as Constant.

    ReadOnly can be overridden:

        Set-Variable -Name MyValue `
            -Value "New Value" `
            -Force

    Constant cannot be overridden.
#>


# ============================================================
# 46. COMMON MISTAKE - CONSTANT OBJECT IMMUTABILITY
# ============================================================
<#
    Constant protects the variable binding.

    It does NOT automatically make a mutable object immutable.

    Example:

        $Configuration.Server = "SERVER02"

    may still be possible even though Configuration itself
    is Constant.
#>


# ============================================================
# 47. WHEN SHOULD YOU USE CONSTANT?
# ============================================================
<#
    Good candidates:

        - Mathematical constants
        - Fixed application identifiers
        - Fixed protocol names
        - Fixed exit codes
        - Values that must never change during the session
        - Script-level fixed configuration values

    Examples:

        Pi
        SecondsPerDay
        ExitSuccess
        ExitFailure
        ApiVersion
#>


# ============================================================
# 48. WHEN SHOULD YOU USE READONLY?
# ============================================================
<#
    ReadOnly is useful when:

        - You want to prevent accidental changes
        - You may intentionally override the value later
        - You want administrative scripts to use -Force
          when necessary
#>


# ============================================================
# 49. WHEN SHOULD YOU USE NORMAL VARIABLES?
# ============================================================
<#
    Use normal variables when the value is expected to change.

    Example:

        $Counter
        $Status
        $CurrentUser
        $ServerName

    Do not make a variable Constant simply because you
    currently do not expect it to change.
#>


# ============================================================
# 50. QUICK REFERENCE
# ============================================================
<#
    NORMAL VARIABLE
    ----------------

        $Name = "John"

        Can be reassigned.


    READONLY
    --------

        Set-Variable `
            -Name Name `
            -Value "John" `
            -Option ReadOnly

        Normal assignment is blocked.

        -Force can change/remove it.


    CONSTANT
    --------

        Set-Variable `
            -Name Name `
            -Value "John" `
            -Option Constant

        Cannot be reassigned.

        Cannot be removed.

        -Force does not override Constant.


    SCOPE + CONSTANT
    ----------------

        Set-Variable `
            -Name ApiVersion `
            -Value "v1" `
            -Option Constant `
            -Scope Script


    ACCESS
    ------

        $ApiVersion
        $script:ApiVersion
        $global:ApiVersion


    INSPECT
    -------

        Get-Variable -Name ApiVersion


    REMOVE
    ------

        Remove-Variable -Name ApiVersion


    MODIFY READONLY
    ---------------

        Set-Variable `
            -Name ApiVersion `
            -Value "v2" `
            -Force
#>


# ============================================================
# 51. FINAL DEMONSTRATION
# ============================================================

Set-Variable -Name DemoPi `
    -Value 3.14159265359 `
    -Option Constant

Set-Variable -Name DemoMaxRetries `
    -Value 3 `
    -Option Constant

Set-Variable -Name DemoApplication `
    -Value "PowerShell Demo" `
    -Option Constant

Write-Host ""
Write-Host "========================================"
Write-Host " PowerShell Constants Demo"
Write-Host "========================================"
Write-Host "Pi           : $DemoPi"
Write-Host "Max Retries  : $DemoMaxRetries"
Write-Host "Application  : $DemoApplication"
Write-Host "========================================"

Write-Host ""
Write-Host "Constant information:"

Get-Variable |
    Where-Object {
        $_.Options -band [System.Management.Automation.ScopedItemOptions]::Constant
    } |
    Select-Object Name, Value, Options


# ============================================================
# END OF FILE
# ============================================================
