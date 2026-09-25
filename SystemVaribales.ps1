
# -----------------------------------------------
# PowerShell System / Environment Variables
# -----------------------------------------------

# Home directory
Write-Output "Home directory: $HOME"

# Current user
Write-Output "Current user: $env:USERNAME"

# Current shell
Write-Output "Current shell: PowerShell"

# Present working directory
Write-Output "Present working directory: $PWD"

# Hostname / Computer name
Write-Output "Hostname: $env:COMPUTERNAME"

# Process ID of this script
Write-Output "Process ID of this script: $PID"

# Get hostname using PowerShell command
$HOSTNAME = hostname

Write-Output "The user currently using host is: $HOSTNAME"

# Read-only variable
Set-Variable -Name DOB -Value "05/06/2001" -Option ReadOnly

Write-Output "The current user DOB is: $DOB"

<#
Bash → PowerShell mapping
Bash	PowerShell
$HOME	$HOME
$USER	$env:USERNAME
$SHELL	$env:SHELL / PowerShell
$PWD	$PWD
$HOSTNAME	$env:COMPUTERNAME
$$	$PID
hostname	hostname
readonly DOB=...	Set-Variable -Option ReadOnly

#>

#You can see all environment variables with:

Get-ChildItem Env: