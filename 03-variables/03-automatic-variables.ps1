<#
.SYNOPSIS
    PowerShell Automatic Variables Reference

.DESCRIPTION
    This file explains commonly used PowerShell automatic variables
    with practical examples.

    The examples below are intentionally UNCOMMENTED so they can
    be executed directly.

    Note:
    Some automatic variables are read-only or managed by PowerShell.
    Their values can change depending on the current command,
    scope, pipeline, session, or execution environment.
#>


# ============================================================
# 1. $_ / $PSItem
# ============================================================
<#
    $_ and $PSItem refer to the current object in the pipeline.

    $_ is the short form.
    $PSItem is the descriptive form.

    These are commonly used with Where-Object, ForEach-Object,
    and other pipeline operations.
#>

1..5 | ForEach-Object {
    $_
}

Get-Process | Where-Object {
    $_.CPU -gt 100
}

Get-Service | Where-Object {
    $_.Status -eq "Running"
}


# ============================================================
# 2. $args
# ============================================================
<#
    $args contains arguments passed to a script or function
    that are not explicitly assigned to named parameters.
#>

function Show-Arguments {
    Write-Host "Number of arguments: $($args.Count)"

    foreach ($argument in $args) {
        Write-Host "Argument: $argument"
    }
}

Show-Arguments "PowerShell" "Windows" "Automation"


# ============================================================
# 3. $input
# ============================================================
<#
    $input represents objects passed to a function, script,
    or script block through the pipeline.

    It is an enumerator and is commonly used when manually
    reading pipeline input.
#>

function Show-Input {
    foreach ($item in $input) {
        Write-Host "Received: $item"
    }
}

"One", "Two", "Three" | Show-Input


# ============================================================
# 4. $PSCmdlet
# ============================================================
<#
    $PSCmdlet provides information and functionality related
    to the current advanced function or cmdlet.

    It is available inside advanced functions.
#>

function Test-PSCmdlet {
    [CmdletBinding()]
    param()

    Write-Host "Command name: $($PSCmdlet.MyInvocation.MyCommand.Name)"
}

Test-PSCmdlet


# ============================================================
# 5. $PSBoundParameters
# ============================================================
<#
    $PSBoundParameters contains parameters that were explicitly
    supplied to an advanced function.
#>

function Show-Parameters {
    [CmdletBinding()]
    param(
        [string]$Name,
        [int]$Age
    )

    Write-Host "Supplied parameters:"

    foreach ($key in $PSBoundParameters.Keys) {
        Write-Host "$key = $($PSBoundParameters[$key])"
    }
}

Show-Parameters -Name "John" -Age 30


# ============================================================
# 6. $PSVersionTable
# ============================================================
<#
    $PSVersionTable contains information about the PowerShell
    version and runtime environment.
#>

$PSVersionTable

Write-Host "PowerShell Version: $($PSVersionTable.PSVersion)"
Write-Host "Edition: $($PSVersionTable.PSEdition)"


# ============================================================
# 7. $PSEdition
# ============================================================
<#
    $PSEdition identifies the PowerShell edition.

    Common values:
        Desktop -> Windows PowerShell 5.1
        Core    -> PowerShell 6+
#>

Write-Host "PowerShell Edition: $PSEdition"


# ============================================================
# 8. $PSVersion
# ============================================================
<#
    $PSVersion contains the current PowerShell version object.
#>

Write-Host "PowerShell Version: $PSVersion"


# ============================================================
# 9. $HOME
# ============================================================
<#
    $HOME contains the current user's home directory.
#>

Write-Host "User Home Directory: $HOME"


# ============================================================
# 10. $PWD
# ============================================================
<#
    $PWD represents the current working directory.

    It is a PathInfo object.
#>

Write-Host "Current Directory: $PWD"
Write-Host "Current Path: $($PWD.Path)"


# ============================================================
# 11. $PSHOME
# ============================================================
<#
    $PSHOME contains the directory where PowerShell is installed.
#>

Write-Host "PowerShell Installation Directory: $PSHOME"


# ============================================================
# 12. $PROFILE
# ============================================================
<#
    $PROFILE contains the path to the current user's
    PowerShell profile script.
#>

Write-Host "PowerShell Profile: $PROFILE"


# ============================================================
# 13. $Error
# ============================================================
<#
    $Error contains the most recent PowerShell errors.

    $Error[0] is normally the most recent error.
#>

Get-Item "C:\This-File-Does-Not-Exist.txt"

Write-Host "Most Recent Error:"
Write-Host $Error[0]


# ============================================================
# 14. $ErrorActionPreference
# ============================================================
<#
    Controls how PowerShell handles non-terminating errors.

    Common values:
        Continue
        Stop
        SilentlyContinue
        Inquire
        Ignore
#>

Write-Host "Current Error Action Preference: $ErrorActionPreference"


# ============================================================
# 15. $WarningPreference
# ============================================================
<#
    Controls how PowerShell handles warning messages.
#>

Write-Host "Warning Preference: $WarningPreference"


# ============================================================
# 16. $VerbosePreference
# ============================================================
<#
    Controls whether verbose messages are displayed.
#>

Write-Host "Verbose Preference: $VerbosePreference"


# ============================================================
# 17. $DebugPreference
# ============================================================
<#
    Controls how PowerShell handles debug messages.
#>

Write-Host "Debug Preference: $DebugPreference"


# ============================================================
# 18. $InformationPreference
# ============================================================
<#
    Controls how information stream messages are handled.
#>

Write-Host "Information Preference: $InformationPreference"


# ============================================================
# 19. $ConfirmPreference
# ============================================================
<#
    Controls when PowerShell commands automatically ask
    for confirmation.
#>

Write-Host "Confirm Preference: $ConfirmPreference"


# ============================================================
# 20. $ProgressPreference
# ============================================================
<#
    Controls how progress records are displayed.
#>

Write-Host "Progress Preference: $ProgressPreference"


# ============================================================
# 21. $Verbose
# ============================================================
<#
    $Verbose is related to the common verbose parameter
    in advanced functions.
#>

function Test-Verbose {
    [CmdletBinding()]
    param()

    Write-Verbose "This is a verbose message."
}

Test-Verbose -Verbose


# ============================================================
# 22. $?
# ============================================================
<#
    $? indicates whether the previous operation succeeded.

    True  = previous operation succeeded
    False = previous operation failed
#>

Write-Host "Hello"
Write-Host "Previous command succeeded: $?"


# ============================================================
# 23. $LASTEXITCODE
# ============================================================
<#
    $LASTEXITCODE contains the exit code returned by the
    last native application or executable.

    Usually:
        0     = success
        Non-0 = failure
#>

cmd /c exit 0

Write-Host "Exit Code: $LASTEXITCODE"


cmd /c exit 1

Write-Host "Exit Code: $LASTEXITCODE"


# ============================================================
# 24. $null
# ============================================================
<#
    $null represents no value.

    It is commonly used to check whether a variable contains
    a value.
#>

$value = $null

if ($null -eq $value) {
    Write-Host "Value is null"
}


# ============================================================
# 25. $true
# ============================================================
<#
    $true represents the Boolean value True.
#>

if ($true) {
    Write-Host "Condition is TRUE"
}


# ============================================================
# 26. $false
# ============================================================
<#
    $false represents the Boolean value False.
#>

if (-not $false) {
    Write-Host "Condition is FALSE"
}


# ============================================================
# 27. $foreach
# ============================================================
<#
    $foreach is an automatic variable available inside
    foreach loops.

    It represents the enumerator used by the foreach loop.
#>

$numbers = 10, 20, 30

foreach ($number in $numbers) {
    Write-Host "Number: $number"
}


# ============================================================
# 28. $switch
# ============================================================
<#
    $switch is an automatic variable available inside
    switch statements.

    It provides access to the switch enumerator.
#>

$value = "PowerShell"

switch ($value) {
    "PowerShell" {
        Write-Host "PowerShell detected"
    }
}


# ============================================================
# 29. $Matches
# ============================================================
<#
    $Matches is populated when the -match operator is used.

    It contains the matched text and named/captured groups.
#>

$text = "Server01"

if ($text -match "Server(\d+)") {
    Write-Host "Full Match: $($Matches[0])"
    Write-Host "Server Number: $($Matches[1])"
}


# ============================================================
# 30. $OFS
# ============================================================
<#
    $OFS means Output Field Separator.

    It controls how arrays are converted to strings.
#>

$OFS = ", "

$items = "PowerShell", "Python", "Java"

Write-Host "$items"


# ============================================================
# 31. $FormatEnumerationLimit
# ============================================================
<#
    Controls how many items from an enumerable collection
    PowerShell displays by default.
#>

Write-Host "Format Enumeration Limit: $FormatEnumerationLimit"


# ============================================================
# 32. $MaximumHistoryCount
# ============================================================
<#
    Specifies the maximum number of commands stored in
    the PowerShell session history.
#>

Write-Host "Maximum History Count: $MaximumHistoryCount"


# ============================================================
# 33. $Host
# ============================================================
<#
    $Host contains information about the current PowerShell host.
#>

Write-Host "Host Name: $($Host.Name)"
Write-Host "Host Version: $($Host.Version)"


# ============================================================
# 34. $ExecutionContext
# ============================================================
<#
    $ExecutionContext contains information about the current
    PowerShell execution environment.
#>

Write-Host "Execution Context Type: $($ExecutionContext.GetType().FullName)"


# ============================================================
# 35. $StackTrace
# ============================================================
<#
    $StackTrace contains the current call stack information.
#>

Write-Host "Current Stack Trace:"
Write-Host $StackTrace


# ============================================================
# 36. $MyInvocation
# ============================================================
<#
    $MyInvocation contains information about how the current
    command, script, or function was invoked.
#>

Write-Host "Invocation Name: $($MyInvocation.MyCommand.Name)"
Write-Host "Script Path: $($MyInvocation.MyCommand.Path)"


# ============================================================
# 37. $PSCommandPath
# ============================================================
<#
    $PSCommandPath contains the full path of the current
    script file.

    It is especially useful inside .ps1 scripts.
#>

Write-Host "Current Script Path: $PSCommandPath"


# ============================================================
# 38. $PSScriptRoot
# ============================================================
<#
    $PSScriptRoot contains the directory from which the
    current script is running.

    Very useful when accessing files relative to a script.
#>

Write-Host "Script Root: $PSScriptRoot"


# ============================================================
# 39. $PSModulePath
# ============================================================
<#
    $env:PSModulePath is an environment variable containing
    directories where PowerShell searches for modules.
#>

Write-Host "Module Search Paths:"
$env:PSModulePath -split [IO.Path]::PathSeparator


# ============================================================
# 40. $env
# ============================================================
<#
    $env:VARIABLE_NAME is used to access environment variables.

    Examples:
        $env:USERNAME
        $env:COMPUTERNAME
        $env:PATH
        $env:TEMP
#>

Write-Host "Username: $env:USERNAME"
Write-Host "Computer Name: $env:COMPUTERNAME"
Write-Host "Temporary Directory: $env:TEMP"


# ============================================================
# 41. $PID
# ============================================================
<#
    $PID contains the process ID of the current PowerShell process.
#>

Write-Host "PowerShell Process ID: $PID"


# ============================================================
# 42. $Process
# ============================================================
<#
    $Process is commonly used as an automatic variable in
    some PowerShell contexts and event handlers.

    Do not confuse it with the Process object returned by
    Get-Process.
#>

Get-Process | Select-Object -First 1


# ============================================================
# 43. $Sender
# ============================================================
<#
    $Sender is used in PowerShell event handling.

    It represents the object that generated the event.
#>

Write-Host "Sender is commonly available inside event action blocks."


# ============================================================
# 44. $Event
# ============================================================
<#
    $Event contains information about the current event
    when processing PowerShell events.
#>

Write-Host "Event information is available inside event handlers."


# ============================================================
# 45. $EventArgs
# ============================================================
<#
    $EventArgs contains arguments associated with an event.
#>

Write-Host "Event arguments are available inside event handlers."


# ============================================================
# 46. $EventSubscriber
# ============================================================
<#
    $EventSubscriber contains information about the event
    subscription when working with PowerShell events.
#>

Write-Host "Event subscriber information is available for event subscriptions."


# ============================================================
# 47. $PSDefaultParameterValues
# ============================================================
<#
    $PSDefaultParameterValues allows default parameter values
    to be configured for commands.

    Example:
    Make Write-Verbose automatically behave as if -Verbose
    was supplied.
#>

$PSDefaultParameterValues["Write-Verbose:Verbose"] = $true

Write-Verbose "This message is displayed because Verbose is enabled."


# ============================================================
# 48. $PSNativeCommandArgumentPassing
# ============================================================
<#
    Controls how PowerShell passes arguments to native
    executables in newer PowerShell versions.

    Common values may include:
        Legacy
        Standard
        Windows
#>

Write-Host "Native Argument Passing Mode: $PSNativeCommandArgumentPassing"


# ============================================================
# 49. $IsWindows
# ============================================================
<#
    $IsWindows is True when PowerShell is running on Windows.
#>

if ($IsWindows) {
    Write-Host "Running on Windows"
}


# ============================================================
# 50. $IsLinux
# ============================================================
<#
    $IsLinux is True when PowerShell is running on Linux.
#>

if ($IsLinux) {
    Write-Host "Running on Linux"
}


# ============================================================
# 51. $IsMacOS
# ============================================================
<#
    $IsMacOS is True when PowerShell is running on macOS.
#>

if ($IsMacOS) {
    Write-Host "Running on macOS"
}


# ============================================================
# 52. $IsCoreCLR
# ============================================================
<#
    $IsCoreCLR indicates whether PowerShell is running on
    the .NET Core / modern .NET runtime.
#>

if ($IsCoreCLR) {
    Write-Host "Running on CoreCLR"
}


# ============================================================
# 53. $PSNativeCommandUseErrorActionPreference
# ============================================================
<#
    In supported PowerShell versions, this variable controls
    whether native command errors are affected by
    $ErrorActionPreference.
#>

Write-Host "Native command error preference: $PSNativeCommandUseErrorActionPreference"


# ============================================================
# 54. $NestedPromptLevel
# ============================================================
<#
    $NestedPromptLevel indicates the current nested prompt level.

    Normally it is 0 during normal execution.
#>

Write-Host "Nested Prompt Level: $NestedPromptLevel"


# ============================================================
# 55. $Script: / $Global: / $Local:
# ============================================================
<#
    These are scope modifiers rather than automatic variables.

    $Global:  -> Global scope
    $Script:  -> Current script scope
    $Local:   -> Current local scope
#>

$Global:MyGlobalVariable = "Global Value"

Write-Host $Global:MyGlobalVariable


# ============================================================
# 56. $env:PATH
# ============================================================
<#
    Environment variables are accessed using the env: scope.
#>

Write-Host "PATH:"
Write-Host $env:PATH


# ============================================================
# 57. $env:USERPROFILE
# ============================================================
<#
    USERPROFILE is commonly available on Windows and points
    to the current user's profile directory.
#>

if ($IsWindows) {
    Write-Host "User Profile: $env:USERPROFILE"
}


# ============================================================
# 58. $env:ProgramFiles
# ============================================================
<#
    ProgramFiles contains the Program Files directory
    on Windows.
#>

if ($IsWindows) {
    Write-Host "Program Files: $env:ProgramFiles"
}


# ============================================================
# 59. $env:windir
# ============================================================
<#
    windir contains the Windows installation directory.
#>

if ($IsWindows) {
    Write-Host "Windows Directory: $env:windir"
}


# ============================================================
# 60. Quick Reference
# ============================================================
<#
    IMPORTANT AUTOMATIC VARIABLES TO REMEMBER

    $_ / $PSItem
        Current pipeline object

    $args
        Unnamed arguments

    $input
        Pipeline input

    $Error
        Error collection

    $?
        Success status of previous operation

    $LASTEXITCODE
        Exit code of the last native executable

    $HOME
        User home directory

    $PWD
        Current directory

    $PSHOME
        PowerShell installation directory

    $PROFILE
        PowerShell profile path

    $PSScriptRoot
        Directory containing current script

    $PSCommandPath
        Full path of current script

    $PSVersionTable
        PowerShell version/environment information

    $PSBoundParameters
        Parameters explicitly supplied to an advanced function

    $MyInvocation
        Invocation information

    $Host
        Current PowerShell host

    $PID
        Current PowerShell process ID

    $null
        No value

    $true
        Boolean True

    $false
        Boolean False

    $Matches
        Results from -match

    $OFS
        Output field separator

    $env:VARIABLE
        Environment variable

    $IsWindows
        True when running on Windows

    $IsLinux
        True when running on Linux

    $IsMacOS
        True when running on macOS
#>


# ============================================================
# END OF FILE
# ============================================================

Write-Host ""
Write-Host "========================================"
Write-Host " PowerShell Automatic Variables Demo"
Write-Host "========================================"
Write-Host "PowerShell Version : $($PSVersionTable.PSVersion)"
Write-Host "Edition            : $PSEdition"
Write-Host "Operating System   : $([System.Environment]::OSVersion)"
Write-Host "Current Directory  : $PWD"
Write-Host "User               : $env:USERNAME"
Write-Host "Computer           : $env:COMPUTERNAME"
Write-Host "Process ID         : $PID"
Write-Host "========================================"
