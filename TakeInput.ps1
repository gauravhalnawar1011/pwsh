# -----------------------------------------------
# PowerShell - Taking Input from User
# -----------------------------------------------

$name = Read-Host "Enter your name"

Write-Output "Hello $name"

#Note: Read-Host returns a string. If you need an integer:

$age = [int](Read-Host "Enter your age")

Write-Output "Your age is $age"


#Taking multiple inputs

$name = Read-Host "Enter your name"
$age = [int](Read-Host "Enter your age")
$city = Read-Host "Enter your city"

Write-Output "Name: $name"
Write-Output "Age: $age"
Write-Output "City: $city"

#Password input For sensitive input such as a password:

$password = Read-Host "Enter your password" -AsSecureString

<#
Bash → PowerShell
Bash	PowerShell
read NAME	$name = Read-Host
read -p "Enter: " NAME	$name = Read-Host "Enter: "
read -s PASSWORD	Read-Host "Password" -AsSecureString

#>