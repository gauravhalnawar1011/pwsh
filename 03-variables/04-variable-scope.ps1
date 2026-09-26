<#
.SYNOPSIS
    PowerShell Variable Scope Reference

.DESCRIPTION
    This file explains PowerShell variable scopes with
    practical examples.

    Main scopes covered:

        1. Local
        2. Script
        3. Global
        4. Private

    Scope modifiers covered:

        $local:
        $script:
        $global:
        $private:

    Additional topics:

        - Scope lookup
        - Child scopes
        - Functions and scope
        - Script scope
        - Module scope
        - Environment variables
        - Scope operators
        - Get-Variable
        - Set-Variable
        - Remove-Variable
        - Scope debugging
#>


# ============================================================
# 1. WHAT IS VARIABLE SCOPE?
# ============================================================
<#
    Variable scope determines:

        - Where a variable exists
        - Where a variable can be accessed
        - How long the variable exists
        - Whether child scopes can see the variable

    Example:

        $name = "John"

    The scope in which $name is created determines where
    PowerShell can access it.
#>

$name = "John"

Write-Host "Name: $name"


# ============================================================
# 2. LOCAL SCOPE
# ============================================================
<#
    Local scope is the current scope.

    At the top level of a script, variables normally belong
    to the current script scope.

    Inside a function, variables created without a scope
    modifier are normally local to that function.
#>

function Test-LocalScope {

    $localVariable = "I am local to the function"

    Write-Host $localVariable
}

Test-LocalScope


# ============================================================
# 3. LOCAL VARIABLE IS NOT AVAILABLE AFTER FUNCTION
# ============================================================
<#
    A variable created inside a function normally exists only
    inside that function's local scope.
#>

function Create-LocalVariable {

    $myVariable = "Function Value"

    Write-Host "Inside function: $myVariable"
}

Create-LocalVariable

Write-Host "Outside function:"
Write-Host $myVariable


# ============================================================
# 4. $local: SCOPE MODIFIER
# ============================================================
<#
    $local: explicitly tells PowerShell to use the current
    local scope.
#>

function Test-LocalModifier {

    $local:message = "Local message"

    Write-Host $local:message
}

Test-LocalModifier


# ============================================================
# 5. GLOBAL SCOPE
# ============================================================
<#
    Global scope is the top-level scope of the PowerShell
    session.

    A variable created using:

        $global:Variable

    is placed in the global scope.
#>

$global:GlobalVariable = "I am a global variable"

Write-Host $GlobalVariable


# ============================================================
# 6. ACCESS GLOBAL VARIABLE FROM FUNCTION
# ============================================================
<#
    Global variables can be accessed from child scopes such
    as functions.
#>

$global:ServerName = "SERVER01"

function Show-ServerName {

    Write-Host "Server: $global:ServerName"
}

Show-ServerName


# ============================================================
# 7. MODIFY GLOBAL VARIABLE FROM FUNCTION
# ============================================================
<#
    If you assign to a variable normally inside a function,
    PowerShell creates/changes the variable in the function's
    local scope.

    To modify the global variable, use:

        $global:Variable
#>

$global:Counter = 10

function Increase-Counter {

    $global:Counter++
}

Increase-Counter

Write-Host "Global Counter: $global:Counter"


# ============================================================
# 8. LOCAL VARIABLE VS GLOBAL VARIABLE
# ============================================================
<#
    This is an important PowerShell scope concept.

    A local variable can have the same name as a global variable.

    The local variable hides the global variable inside
    the current scope.
#>

$global:Name = "Global John"

function Test-VariableScope {

    $Name = "Local Peter"

    Write-Host "Inside function: $Name"
    Write-Host "Global variable: $global:Name"
}

Test-VariableScope

Write-Host "Outside function: $Name"


# ============================================================
# 9. SCRIPT SCOPE
# ============================================================
<#
    Script scope belongs to the currently running script.

    Use:

        $script:Variable

    to explicitly access a variable in the current script scope.
#>

$script:ScriptVariable = "Script Scope Value"

Write-Host $script:ScriptVariable


# ============================================================
# 10. SCRIPT VARIABLE FROM FUNCTION
# ============================================================
<#
    A function defined inside a script can access variables
    from the script scope.

    The $script: scope modifier makes the intent explicit.
#>

$script:ApplicationName = "My PowerShell Application"

function Show-ApplicationName {

    Write-Host "Application: $script:ApplicationName"
}

Show-ApplicationName


# ============================================================
# 11. MODIFY SCRIPT VARIABLE FROM FUNCTION
# ============================================================
<#
    To modify a variable in the script scope from a function,
    use $script:.
#>

$script:BuildNumber = 100

function Update-BuildNumber {

    $script:BuildNumber++
}

Update-BuildNumber

Write-Host "Build Number: $script:BuildNumber"


# ============================================================
# 12. GLOBAL VS SCRIPT SCOPE
# ============================================================
<#
    Important difference:

        $global:
            Entire PowerShell session

        $script:
            Current script

    A script variable is associated with the currently
    executing script.

    A global variable belongs to the PowerShell session.
#>

$global:GlobalValue = "Global"
$script:ScriptValue = "Script"

Write-Host "Global: $global:GlobalValue"
Write-Host "Script: $script:ScriptValue"


# ============================================================
# 13. CHILD SCOPE
# ============================================================
<#
    Functions and some other PowerShell constructs create
    child scopes.

    Child scopes can generally READ variables from parent
    scopes.

    However, assigning to a variable normally creates or
    modifies a variable in the current scope.
#>

$ParentVariable = "Parent Value"

function Test-ChildScope {

    Write-Host "Child can read parent variable:"
    Write-Host $ParentVariable
}

Test-ChildScope


# ============================================================
# 14. CHILD SCOPE VARIABLE
# ============================================================
<#
    A variable created inside the child scope does not
    automatically appear in the parent scope.
#>

function Create-ChildVariable {

    $ChildVariable = "Created inside function"

    Write-Host $ChildVariable
}

Create-ChildVariable

Write-Host "Outside function:"
Write-Host $ChildVariable


# ============================================================
# 15. VARIABLE LOOKUP
# ============================================================
<#
    When PowerShell encounters:

        $Name

    it searches for the variable in the current scope.

    If it does not find it, PowerShell can look in parent
    scopes.
#>

$Name = "Parent Name"

function Find-Name {

    Write-Host "Name: $Name"
}

Find-Name


# ============================================================
# 16. SHADOWING
# ============================================================
<#
    Shadowing occurs when a child scope creates a variable
    with the same name as a parent variable.

    The child variable hides the parent variable within
    that child scope.
#>

$Color = "Red"

function Test-Shadowing {

    $Color = "Blue"

    Write-Host "Inside function: $Color"
}

Test-Shadowing

Write-Host "Outside function: $Color"


# ============================================================
# 17. USING $global: TO AVOID SHADOWING
# ============================================================
<#
    You can explicitly access the global variable using
    $global:.
#>

$global:Color = "Red"

function Show-Colors {

    $Color = "Blue"

    Write-Host "Local Color : $Color"
    Write-Host "Global Color: $global:Color"
}

Show-Colors


# ============================================================
# 18. USING $script: TO AVOID SHADOWING
# ============================================================
<#
    $script: allows a function inside a script to explicitly
    access a script-level variable.
#>

$script:Environment = "Production"

function Show-Environment {

    Write-Host "Environment: $script:Environment"
}

Show-Environment


# ============================================================
# 19. PRIVATE SCOPE
# ============================================================
<#
    Private scope prevents a variable from being visible
    through normal scope lookup from child scopes.

    Syntax:

        $private:Variable

    Private variables are primarily useful when you want
    to keep implementation details hidden.
#>

$private:SecretValue = "Private Value"

Write-Host "Private value in current scope: $private:SecretValue"


# ============================================================
# 20. PRIVATE VARIABLE EXAMPLE
# ============================================================
<#
    A private variable is not normally available through
    normal lookup from a child scope.
#>

function Test-PrivateScope {

    Write-Host "Trying to access private variable:"
    Write-Host $private:SecretValue
}

Test-PrivateScope


# ============================================================
# 21. SCOPE MODIFIERS QUICK EXAMPLE
# ============================================================
<#
    The four important scope modifiers:

        $local:
        $script:
        $global:
        $private:
#>

$local:LocalExample = "Local"
$script:ScriptExample = "Script"
$global:GlobalExample = "Global"
$private:PrivateExample = "Private"

Write-Host "Local   : $local:LocalExample"
Write-Host "Script  : $script:ScriptExample"
Write-Host "Global  : $global:GlobalExample"
Write-Host "Private : $private:PrivateExample"


# ============================================================
# 22. GET-VARIABLE
# ============================================================
<#
    Get-Variable displays variables available in the current
    PowerShell session/scope.
#>

Get-Variable


# ============================================================
# 23. GET-VARIABLE BY NAME
# ============================================================
<#
    You can retrieve a specific variable.
#>

$MyVariable = "Hello PowerShell"

Get-Variable -Name MyVariable


# ============================================================
# 24. GET-VARIABLE WITH SCOPE
# ============================================================
<#
    Get-Variable supports the -Scope parameter.

    Common scope values:

        0 -> Current scope
        1 -> Parent scope
        2 -> Grandparent scope
#>

Get-Variable -Name MyVariable -Scope 0


# ============================================================
# 25. SET-VARIABLE
# ============================================================
<#
    Set-Variable can create or modify a variable.
#>

Set-Variable -Name City -Value "Pune"

Write-Host $City


# ============================================================
# 26. SET-VARIABLE WITH SCOPE
# ============================================================
<#
    The -Scope parameter allows you to specify where the
    variable should be created.
#>

Set-Variable -Name GlobalCity -Value "Mumbai" -Scope Global

Write-Host $global:GlobalCity


# ============================================================
# 27. REMOVE-VARIABLE
# ============================================================
<#
    Remove-Variable removes a variable from the current scope.
#>

$TemporaryVariable = "Temporary"

Write-Host "Before removal: $TemporaryVariable"

Remove-Variable -Name TemporaryVariable

Write-Host "Variable removed."


# ============================================================
# 28. REMOVE GLOBAL VARIABLE
# ============================================================
<#
    You can remove a variable from global scope explicitly.
#>

$global:TemporaryGlobal = "Temporary Global Value"

Write-Host $global:TemporaryGlobal

Remove-Variable -Name TemporaryGlobal -Scope Global


# ============================================================
# 29. SCOPE NUMBERING
# ============================================================
<#
    PowerShell also allows scope access using numeric values.

        Scope 0 = Current scope
        Scope 1 = Parent scope
        Scope 2 = Parent's parent scope

    Example:
#>

$ScopeTest = "Current Scope"

function Test-ScopeNumber {

    Write-Host "Current scope:"
    Get-Variable -Name ScopeTest -Scope 1 -ErrorAction SilentlyContinue
}

Test-ScopeNumber


# ============================================================
# 30. FUNCTION PARAMETER SCOPE
# ============================================================
<#
    Function parameters are local to the function.
#>

function Show-User {

    param(
        [string]$UserName
    )

    Write-Host "Inside function: $UserName"
}

Show-User -UserName "John"


# ============================================================
# 31. PARAMETER DOES NOT AUTOMATICALLY BECOME GLOBAL
# ============================================================
<#
    Function parameters are normally local variables.

    They do not automatically become global variables.
#>

function Test-Parameter {

    param(
        [string]$UserName
    )

    Write-Host "User: $UserName"
}

Test-Parameter -UserName "Alice"

Write-Host "Outside function:"
Write-Host $UserName


# ============================================================
# 32. GLOBAL VARIABLE + FUNCTION PARAMETER
# ============================================================
<#
    A function parameter can have the same name as a global
    variable.

    The function parameter takes precedence inside the function.
#>

$global:UserName = "Global User"

function Show-UserName {

    param(
        [string]$UserName
    )

    Write-Host "Function UserName: $UserName"
    Write-Host "Global UserName  : $global:UserName"
}

Show-UserName -UserName "Function User"


# ============================================================
# 33. SCRIPT SCOPE IN A .PS1 FILE
# ============================================================
<#
    Consider a script named:

        MyScript.ps1

    A variable created at script level:

        $script:Server

    belongs to the script scope.

    Functions inside that script can access it using
    $script:Server.
#>

$script:Server = "SERVER01"

function Show-Server {

    Write-Host "Server: $script:Server"
}

Show-Server


# ============================================================
# 34. GLOBAL VARIABLE FROM A SCRIPT
# ============================================================
<#
    A script can intentionally create a global variable.

    This variable remains available in the PowerShell session
    after the script completes.

    Use global variables carefully because they can make
    scripts harder to understand and maintain.
#>

$global:ScriptStatus = "Completed"

Write-Host "Global Script Status: $global:ScriptStatus"


# ============================================================
# 35. DOT SOURCING AND SCOPE
# ============================================================
<#
    Dot sourcing runs a script in the current scope.

    Syntax:

        . .\MyScript.ps1

    Variables/functions created by the script can therefore
    become available in the calling scope.

    Example:

        . .\MyScript.ps1

    This is different from:

        .\MyScript.ps1
#>

Write-Host "Dot sourcing example:"
Write-Host ". .\MyScript.ps1"


# ============================================================
# 36. NORMAL SCRIPT EXECUTION VS DOT SOURCING
# ============================================================
<#
    Normal execution:

        .\MyScript.ps1

    Dot sourcing:

        . .\MyScript.ps1

    Dot sourcing is useful when you intentionally want to
    load functions or variables into the current scope.
#>

Write-Host "Normal execution:"
Write-Host ".\MyScript.ps1"

Write-Host "Dot sourcing:"
Write-Host ". .\MyScript.ps1"


# ============================================================
# 37. ENVIRONMENT VARIABLE SCOPE
# ============================================================
<#
    Environment variables use the env: scope.

    Example:

        $env:PATH
        $env:USERNAME
        $env:TEMP
#>

Write-Host "USERNAME: $env:USERNAME"
Write-Host "TEMP    : $env:TEMP"


# ============================================================
# 38. CREATE ENVIRONMENT VARIABLE
# ============================================================
<#
    Creating:

        $env:MyVariable

    changes the environment of the current PowerShell process.

    It does not automatically create a permanent Windows
    environment variable.
#>

$env:MyPowerShellVariable = "Hello"

Write-Host $env:MyPowerShellVariable


# ============================================================
# 39. REMOVE ENVIRONMENT VARIABLE
# ============================================================
<#
    Remove an environment variable using Remove-Item.
#>

$env:TemporaryEnvironmentVariable = "Temporary"

Write-Host $env:TemporaryEnvironmentVariable

Remove-Item Env:TemporaryEnvironmentVariable


# ============================================================
# 40. SCOPE INSPECTION
# ============================================================
<#
    Get-Variable can be used to inspect variables in different
    scopes.
#>

$global:InspectionVariable = "Global Value"

function Inspect-Scope {

    Write-Host "Current scope variables:"
    Get-Variable -Scope 0 | Select-Object -First 10

    Write-Host ""
    Write-Host "Parent scope variables:"
    Get-Variable -Scope 1 | Select-Object -First 10
}

Inspect-Scope


# ============================================================
# 41. FUNCTION CREATES LOCAL VARIABLE
# ============================================================
<#
    This is one of the most important rules:

        Assignment without a scope modifier
        normally affects the current scope.
#>

$Value = "Outside"

function Change-Value {

    $Value = "Inside"

    Write-Host "Inside: $Value"
}

Change-Value

Write-Host "Outside: $Value"


# ============================================================
# 42. FUNCTION MODIFIES SCRIPT VARIABLE
# ============================================================
<#
    Use $script: when you intentionally want a function
    to modify a script-level variable.
#>

$script:Status = "Started"

function Complete-Task {

    $script:Status = "Completed"
}

Complete-Task

Write-Host "Status: $script:Status"


# ============================================================
# 43. FUNCTION MODIFIES GLOBAL VARIABLE
# ============================================================
<#
    Use $global: when you intentionally want to modify a
    global variable.
#>

$global:Status = "Started"

function Complete-GlobalTask {

    $global:Status = "Completed"
}

Complete-GlobalTask

Write-Host "Global Status: $global:Status"


# ============================================================
# 44. LOCAL SCOPE VS SCRIPT SCOPE VS GLOBAL SCOPE
# ============================================================
<#
    Summary:

        $variable
            Current/local scope

        $local:variable
            Explicit current scope

        $script:variable
            Current script scope

        $global:variable
            Global PowerShell session scope

        $private:variable
            Private to current scope
#>

$LocalExample = "Local"
$script:ScriptExample2 = "Script"
$global:GlobalExample2 = "Global"
$private:PrivateExample2 = "Private"

Write-Host $LocalExample
Write-Host $script:ScriptExample2
Write-Host $global:GlobalExample2
Write-Host $private:PrivateExample2


# ============================================================
# 45. COMMON SCOPE MISTAKE
# ============================================================
<#
    WRONG EXPECTATION:

        $count = 0

        function Increment {
            $count++
        }

    Many beginners expect the outer $count to change.

    The safer and clearer approach is to explicitly use
    $script: or $global: when that is actually the intended
    behavior.
#>

$script:Count = 0

function Increment-Count {

    $script:Count++
}

Increment-Count
Increment-Count
Increment-Count

Write-Host "Count: $script:Count"


# ============================================================
# 46. BETTER APPROACH: RETURN VALUES
# ============================================================
<#
    Instead of relying heavily on global/script variables,
    functions can return values.

    This usually makes functions easier to reuse and test.
#>

function Get-NextNumber {

    param(
        [int]$Number
    )

    return $Number + 1
}

$result = Get-NextNumber -Number 10

Write-Host "Result: $result"


# ============================================================
# 47. SCOPE WITH RETURN VALUES
# ============================================================
<#
    Prefer:

        $result = FunctionName

    over modifying global variables when possible.
#>

function Get-ServerStatus {

    return "Online"
}

$status = Get-ServerStatus

Write-Host "Server Status: $status"


# ============================================================
# 48. MODULE SCOPE
# ============================================================
<#
    Modules have their own module scope.

    Variables/functions inside a module can be kept private
    to the module unless they are explicitly exported.

    Example concept:

        Module Scope
             |
             +-- Private functions
             +-- Private variables
             +-- Exported functions
             +-- Exported variables
#>

Write-Host "Modules have their own module scope."


# ============================================================
# 49. SCOPE HIERARCHY
# ============================================================
<#
    A simplified way to understand PowerShell scope:

        Global Scope
             |
             +-- Script Scope
                    |
                    +-- Function Scope
                           |
                           +-- Nested Function Scope

    A child scope can generally read variables from parent
    scopes.

    Assignment without a scope modifier operates in the
    current scope.
#>

Write-Host "Global"
Write-Host "  -> Script"
Write-Host "      -> Function"
Write-Host "          -> Nested Function"


# ============================================================
# 50. PRACTICAL EXAMPLE
# ============================================================
<#
    Example of script configuration.

    Script-level configuration can be accessed by functions
    using $script:.
#>

$script:Config = @{
    Environment = "Production"
    Server      = "SERVER01"
    Port        = 443
}

function Show-Configuration {

    Write-Host "Environment: $script:Config.Environment"
    Write-Host "Server     : $script:Config.Server"
    Write-Host "Port       : $script:Config.Port"
}

Show-Configuration


# ============================================================
# 51. PRACTICAL EXAMPLE - COUNTER
# ============================================================
<#
    Script-scoped state can be maintained explicitly.

    This is useful in some scripts, although returning values
    is often preferable for reusable functions.
#>

$script:ExecutionCount = 0

function Register-Execution {

    $script:ExecutionCount++
}

Register-Execution
Register-Execution
Register-Execution

Write-Host "Execution Count: $script:ExecutionCount"


# ============================================================
# 52. PRACTICAL EXAMPLE - GLOBAL CONFIGURATION
# ============================================================
<#
    Global variables can be useful interactively, but avoid
    unnecessary global state in production scripts.
#>

$global:EnvironmentName = "Development"

function Show-EnvironmentName {

    Write-Host "Environment: $global:EnvironmentName"
}

Show-EnvironmentName


# ============================================================
# 53. SCOPE WITH NESTED FUNCTIONS
# ============================================================
<#
    Nested functions introduce additional child scopes.

    Parent variables can be read from the nested function.
#>

$OuterValue = "Outer"

function Outer-Function {

    $MiddleValue = "Middle"

    function Inner-Function {

        Write-Host "Outer : $OuterValue"
        Write-Host "Middle: $MiddleValue"
    }

    Inner-Function
}

Outer-Function


# ============================================================
# 54. SCOPE DEBUGGING
# ============================================================
<#
    When debugging scope problems, check:

        1. Where was the variable created?
        2. Which scope is currently executing?
        3. Is there a variable with the same name in a
           child scope?
        4. Should $script: be used?
        5. Should $global: be used?
        6. Would returning a value be better?
#>

$DebugVariable = "Debug Value"

function Debug-Scope {

    Write-Host "Variable value: $DebugVariable"

    Get-Variable -Name DebugVariable -ErrorAction SilentlyContinue
}

Debug-Scope


# ============================================================
# 55. IMPORTANT RULES
# ============================================================
<#
    RULE 1
    Variables created in a function are normally local
    to that function.

    RULE 2
    Child scopes can generally read parent variables.

    RULE 3
    Assignment normally operates on the current scope.

    RULE 4
    Use $script: to intentionally access the current
    script's scope.

    RULE 5
    Use $global: to intentionally access the global scope.

    RULE 6
    Use $private: when you want to prevent normal child-scope
    visibility.

    RULE 7
    Function parameters are local to the function.

    RULE 8
    Avoid unnecessary global variables.

    RULE 9
    Prefer returning values from functions when possible.

    RULE 10
    Use Get-Variable when debugging scope problems.
#>


# ============================================================
# 56. QUICK REFERENCE
# ============================================================
<#
    +----------------+-----------------------------------------+
    | Scope          | Meaning                                 |
    +----------------+-----------------------------------------+
    | Local          | Current scope                           |
    | Script         | Current .ps1 script scope               |
    | Global         | PowerShell session's global scope       |
    | Private        | Hidden from normal child-scope lookup   |
    | Module         | Scope belonging to a PowerShell module  |
    +----------------+-----------------------------------------+

    Scope modifiers:

        $local:Variable
            Current scope

        $script:Variable
            Current script scope

        $global:Variable
            Global session scope

        $private:Variable
            Private current-scope variable

    Useful commands:

        Get-Variable
        Set-Variable
        Remove-Variable

    Useful concepts:

        Child scope
        Parent scope
        Shadowing
        Dot sourcing
        Function scope
        Script scope
        Module scope
        Environment scope
#>


# ============================================================
# 57. FINAL DEMONSTRATION
# ============================================================

$global:DemoGlobal = "GLOBAL"
$script:DemoScript = "SCRIPT"
$DemoLocal = "LOCAL"
$private:DemoPrivate = "PRIVATE"

function Show-ScopeDemo {

    Write-Host ""
    Write-Host "===== SCOPE DEMO ====="

    Write-Host "Local  : $DemoLocal"
    Write-Host "Script : $script:DemoScript"
    Write-Host "Global : $global:DemoGlobal"
    Write-Host "Private: $private:DemoPrivate"
}

Show-ScopeDemo

Write-Host ""
Write-Host "===== END OF VARIABLE SCOPE DEMO ====="
