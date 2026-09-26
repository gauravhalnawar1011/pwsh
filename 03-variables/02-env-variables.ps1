# ==========================================================
# ENVIRONMENT VARIABLES IN POWERSHELL
# ==========================================================

<#
Environment variables are variables provided by the
operating system and applications.

They contain configuration information such as:

- Current username
- Computer name
- Operating system information
- PATH locations
- Temporary folder locations
- User profile location

PowerShell accesses environment variables using:

$env:VARIABLE_NAME

Examples:

$env:USERNAME
$env:COMPUTERNAME
$env:USERPROFILE
$env:TEMP
$env:PATH
#>


# ==========================================================
# 1. VIEW A SPECIFIC ENVIRONMENT VARIABLE
# ==========================================================

<#
Use $env: followed by the environment variable name.
#>

$env:USERNAME
$env:COMPUTERNAME
$env:USERPROFILE
$env:TEMP


# ==========================================================
# 2. PATH ENVIRONMENT VARIABLE
# ==========================================================

<#
PATH contains a list of directories where the operating
system looks for executable programs.

When you run:

pwsh

or:

python

PowerShell/Windows can find the executable because its
location may exist in PATH.
#>

$env:PATH


# ==========================================================
# 3. DISPLAY PATH AS SEPARATE ENTRIES
# ==========================================================

<#
On Windows, PATH entries are separated using a semicolon (;).

PowerShell can split the PATH into individual directories.
#>

$env:PATH -split ';'


# ==========================================================
# 4. LIST ALL ENVIRONMENT VARIABLES
# ==========================================================

<#
The Env: PowerShell drive provides access to all
environment variables.

Get-ChildItem Env:
is commonly used to display them.
#>

Get-ChildItem Env:


# Another way:

Get-Item Env:*


# ==========================================================
# 5. GET A SPECIFIC ENVIRONMENT VARIABLE
# ==========================================================

<#
Get-Item can retrieve a specific environment variable.
#>

Get-Item Env:USERNAME
Get-Item Env:PATH


# ==========================================================
# 6. CREATE AN ENVIRONMENT VARIABLE
# ==========================================================

<#
You can create an environment variable using:

$env:VARIABLE_NAME = "value"

This changes the environment for the current PowerShell
process.
#>

$env:MY_APP_NAME = "PowerShellDemo"

$env:MY_APP_NAME


# ==========================================================
# 7. MODIFY AN ENVIRONMENT VARIABLE
# ==========================================================

<#
Assign a new value to an existing environment variable.
#>

$env:MY_APP_NAME = "MyApplication"

$env:MY_APP_NAME


# ==========================================================
# 8. REMOVE AN ENVIRONMENT VARIABLE
# ==========================================================

<#
Set the environment variable to $null to remove it from
the current PowerShell process environment.
#>

$env:MY_APP_NAME = $null

$env:MY_APP_NAME


# ==========================================================
# 9. ENVIRONMENT VARIABLES VS NORMAL VARIABLES
# ==========================================================

<#
Normal PowerShell variable:

$name = "John"

Environment variable:

$env:NAME = "John"

Normal variable:
- Exists in PowerShell's variable scope.

Environment variable:
- Is part of the process environment.
- Can be inherited by child processes.

#>

$name = "John"

$env:NAME = "John"

$name
$env:NAME


# ==========================================================
# 10. CHILD PROCESSES
# ==========================================================

<#
Environment variables are inherited by processes started
from the current process.

For example, if PowerShell starts another application,
that application can normally see the environment variables
inherited from PowerShell.
#>

$env:MY_APP_NAME = "PowerShellDemo"

pwsh -Command '$env:MY_APP_NAME'


# ==========================================================
# 11. USERNAME
# ==========================================================

<#
$env:USERNAME contains the current user's username.
#>

Write-Host "Username: $env:USERNAME"


# ==========================================================
# 12. COMPUTER NAME
# ==========================================================

<#
$env:COMPUTERNAME contains the computer's name on Windows.
#>

Write-Host "Computer Name: $env:COMPUTERNAME"


# ==========================================================
# 13. USER PROFILE
# ==========================================================

<#
$env:USERPROFILE usually points to the current user's
profile directory on Windows.

Example:

C:\Users\John
#>

Write-Host "User Profile: $env:USERPROFILE"


# ==========================================================
# 14. TEMP DIRECTORY
# ==========================================================

<#
$env:TEMP contains the location of the user's temporary
files directory.
#>

Write-Host "Temporary Directory: $env:TEMP"


# ==========================================================
# 15. HOME DIRECTORY
# ==========================================================

<#
$env:HOME may be available depending on the operating system
and environment.

PowerShell also provides the automatic variable:

$HOME
#>

$HOME


# ==========================================================
# 16. CURRENT WORKING DIRECTORY
# ==========================================================

<#
PowerShell provides $PWD for the current working directory.

Note:
$PWD is a PowerShell automatic variable, not an environment
variable.
#>

$PWD


# ==========================================================
# 17. ENVIRONMENT VARIABLES WITH IF
# ==========================================================

<#
Environment variables can be used in conditions just like
normal variables.
#>

if ($env:USERNAME) {
    Write-Host "Username is available."
}


# ==========================================================
# 18. USING ENVIRONMENT VARIABLES IN STRINGS
# ==========================================================

<#
Environment variables can be expanded inside double-quoted
strings.
#>

Write-Host "Current user is $env:USERNAME"
Write-Host "Computer name is $env:COMPUTERNAME"
Write-Host "Temp folder is $env:TEMP"


# ==========================================================
# 19. ACCESS ENVIRONMENT VARIABLES USING BRACKETS
# ==========================================================

<#
You can also access the environment provider using
PowerShell's Get-Item and Get-Content style commands.
#>

(Get-Item Env:USERNAME).Value
(Get-Item Env:COMPUTERNAME).Value


# ==========================================================
# 20. ENVIRONMENT VARIABLES AND .NET
# ==========================================================

<#
.NET can also be used to read environment variables.

This is useful when working with .NET APIs.
#>

[System.Environment]::GetEnvironmentVariable("USERNAME")


# ==========================================================
# 21. SET ENVIRONMENT VARIABLE USING .NET
# ==========================================================

<#
You can set an environment variable for the current process
using the .NET Environment class.
#>

[System.Environment]::SetEnvironmentVariable(
    "MY_VARIABLE",
    "Hello"
)

$env:MY_VARIABLE


# ==========================================================
# 22. PROCESS-LEVEL ENVIRONMENT VARIABLE
# ==========================================================

<#
Environment variables can exist at different levels.

Process:
    Available to the current process and child processes.

User:
    Available to the current user.

Machine:
    Available system-wide.

The following example creates a variable for the current
process.
#>

[System.Environment]::SetEnvironmentVariable(
    "MY_PROCESS_VARIABLE",
    "ProcessValue",
    "Process"
)

$env:MY_PROCESS_VARIABLE


# ==========================================================
# 23. VIEW ENVIRONMENT VARIABLE TARGET
# ==========================================================

<#
GetEnvironmentVariable can specify a target:

"Process"
"User"
"Machine"

Example:
#>

[System.Environment]::GetEnvironmentVariable(
    "PATH",
    "Process"
)


# ==========================================================
# 24. USER ENVIRONMENT VARIABLES
# ==========================================================

<#
User-level environment variables belong to the current user.

Changing persistent user-level environment variables affects
future processes, not necessarily the already-running
PowerShell process.
#>

[System.Environment]::SetEnvironmentVariable(
    "MY_USER_VARIABLE",
    "HelloUser",
    "User"
)


# ==========================================================
# 25. MACHINE ENVIRONMENT VARIABLES
# ==========================================================

<#
Machine-level environment variables apply to the computer.

Changing machine-level environment variables generally
requires administrator privileges.

Use carefully.
#>

# [System.Environment]::SetEnvironmentVariable(
#     "MY_MACHINE_VARIABLE",
#     "HelloMachine",
#     "Machine"
# )


# ==========================================================
# 26. IMPORTANT DIFFERENCE
# ==========================================================

<#
This:

$env:MY_VARIABLE = "Hello"

changes the environment of the CURRENT PowerShell process.

It does not automatically mean that a permanent User or
Machine environment variable has been created.

For persistent User/Machine settings, use the .NET
Environment API or the Windows environment-variable
management tools.
#>


# ==========================================================
# 27. PRACTICAL EXAMPLE
# ==========================================================

<#
Imagine an application needs to know which environment
it should run in.

We can define:

Development
Testing
Production
#>

$env:APP_ENVIRONMENT = "Development"

Write-Host "Application Environment: $env:APP_ENVIRONMENT"


# ==========================================================
# 28. PRACTICAL CONFIGURATION EXAMPLE
# ==========================================================

<#
Environment variables are commonly used for configuration.

For example:

APP_NAME
APP_ENVIRONMENT
API_URL
LOG_LEVEL

This avoids hard-coding configuration directly into a script.
#>

$env:APP_NAME = "MyPowerShellApp"
$env:APP_ENVIRONMENT = "Development"
$env:LOG_LEVEL = "Debug"

Write-Host "Application: $env:APP_NAME"
Write-Host "Environment: $env:APP_ENVIRONMENT"
Write-Host "Log Level: $env:LOG_LEVEL"


# ==========================================================
# QUICK REFERENCE
# ==========================================================

<#
READ:

$env:USERNAME

LIST ALL:

Get-ChildItem Env:

READ WITH .NET:

[System.Environment]::GetEnvironmentVariable("PATH")

CREATE FOR CURRENT PROCESS:

$env:MY_VARIABLE = "Hello"

REMOVE FROM CURRENT PROCESS:

$env:MY_VARIABLE = $null

SET USER VARIABLE:

[System.Environment]::SetEnvironmentVariable(
    "MY_VARIABLE",
    "Hello",
    "User"
)

SET PROCESS VARIABLE:

[System.Environment]::SetEnvironmentVariable(
    "MY_VARIABLE",
    "Hello",
    "Process"
)

GET PATH:

$env:PATH

SPLIT PATH:

$env:PATH -split ';'

===========================================================
END OF ENVIRONMENT VARIABLES
===========================================================
#>
