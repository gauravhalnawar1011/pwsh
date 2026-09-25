# ============================================================
# PowerShell Variables
# ============================================================

# A variable is created using the $ symbol.
# Syntax:
# $variableName = value

$name = "Gaurav"
$age = 25

Write-Output $name
Write-Output $age


# ============================================================
# Getting the Data Type of a Variable
# ============================================================

# GetType() tells us the .NET data type of the variable.

$name.GetType()
$age.GetType()


# You can also get the full type name:

$name.GetType().FullName
$age.GetType().FullName


# ============================================================
# Common PowerShell Data Types
# ============================================================


# 1. String
# Text values are stored as strings.

$name = "Gaurav"
$city = 'Pune'

Write-Output $name
Write-Output $city

$name.GetType()


# 2. Integer
# Whole numbers.

$age = 25

Write-Output $age
$age.GetType()


# 3. Double
# Decimal/floating-point numbers.

$price = 99.99

Write-Output $price
$price.GetType()


# 4. Boolean
# True or False.

$isActive = $true
$isAdmin = $false

Write-Output $isActive
Write-Output $isAdmin

$isActive.GetType()


# 5. Array
# An array stores multiple values.
 # indexes    0         1         2
$fruits = @("Apple", "Banana", "Mango")

Write-Output $fruits

# Access individual items
Write-Output $fruits[0]
Write-Output $fruits[1]

$fruits.GetType()


# 6. Hashtable
# Stores data as key/value pairs.

$user = @{
    Name = "Gaurav"
    Age  = 25
    City = "Pune"
}

Write-Output $user

# Access a value
Write-Output $user["Name"]
Write-Output $user["City"]

$user.GetType()


# 7. DateTime
# Stores date and time information.

$currentDate = Get-Date

Write-Output $currentDate
$currentDate.GetType()


# 8. Object
# PowerShell commonly works with objects.

$computer = Get-ComputerInfo

Write-Output $computer


# ============================================================
# Working with Get-Process
# ============================================================

# Get-Process returns process objects.

$ps = Get-Process

Write-Output $ps


# Get the type of the variable

$ps.GetType()


# Get information about the first process

$ps[0]

# Get the process name

$ps[0].Name

# Get the process ID

$ps[0].Id


# ============================================================
# Useful Variable Examples
# ============================================================

$firstName = "Gaurav"
$lastName = "H"

$fullName = "$firstName $lastName"

Write-Output $fullName


# Mathematical operations

$a = 10
$b = 5

$sum = $a + $b
$difference = $a - $b
$product = $a * $b
$division = $a / $b

Write-Output $sum
Write-Output $difference
Write-Output $product
Write-Output $division


# ============================================================
# Checking Variables
# ============================================================

# List variables currently available in the session

Get-Variable


# Check a specific variable

Get-Variable name


# Remove a variable

$temp = "test"

Write-Output $temp

Remove-Variable temp

# $temp no longer exists


# ============================================================
# Summary of Common Data Types
# ============================================================

# String      -> "Hello"
# Int32       -> 100
# Int64       -> 10000000000
# Double      -> 10.50
# Decimal     -> 99.99
# Boolean     -> $true / $false
# Array       -> @(1, 2, 3)
# Hashtable   -> @{Name="Gaurav"; Age=25}
# DateTime    -> Get-Date
# Object      -> Get-Process
# Null        -> $null



