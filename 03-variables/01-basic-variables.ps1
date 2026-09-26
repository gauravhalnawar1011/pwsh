<#
===========================================================
PowerShell - Basic Variables
===========================================================

This file covers:

1. What is a variable?
2. Creating variables
3. Getting variable values
4. Variable naming rules
5. Different data types
6. Strings
7. Numbers
8. Boolean values
9. Arrays
10. Hash tables
11. Multiple variable assignment
12. Updating variables
13. Removing variables
14. Checking variable type
15. Environment variables
16. Read-Only variables
17. Constants
18. Variable interpolation
19. Expressions with variables
20. Useful variable commands
===========================================================
#>


# ==========================================================
# 1. WHAT IS A VARIABLE?
# ==========================================================

<#
A variable is a named location used to store a value.

In PowerShell, variables start with the $ symbol.

Syntax:

$variableName = value

Example:
$name = "John"

The variable $name now contains the value "John".
#>

$name = "John"
$name


# ==========================================================
# 2. CREATING VARIABLES
# ==========================================================

<#
Variables can store different kinds of values.

Examples:
- Text
- Numbers
- Boolean values
- Arrays
- Objects
- Hash tables
#>

$firstName = "John"
$age = 25
$isEmployee = $true


# ==========================================================
# 3. GETTING THE VALUE OF A VARIABLE
# ==========================================================

<#
Simply type the variable name to display its value.
#>

$city = "Pune"

$city


# ==========================================================
# 4. VARIABLE NAMING RULES
# ==========================================================

<#
PowerShell variable names:

- Must start with $
- Can contain letters
- Can contain numbers
- Can contain underscore _
- Can contain special characters in some cases

Good examples:

$userName
$user_name
$userName1
$employeeCount

Avoid confusing names.

PowerShell variable names are generally case-insensitive.

$name
$Name
$NAME

These refer to the same variable.
#>

$userName = "Alice"
$userName


# ==========================================================
# 5. STRINGS
# ==========================================================

<#
A string contains text.

Single quotes:
'Hello'

Double quotes:
"Hello"

Double-quoted strings support variable expansion.

Single-quoted strings do not expand variables.
#>

$name = "Alice"

$message1 = 'Hello $name'
$message2 = "Hello $name"

$message1
$message2


# ==========================================================
# 6. NUMBERS
# ==========================================================

<#
PowerShell supports numeric values.

Examples:
- Integer
- Decimal
- Double
- Long
etc.

PowerShell automatically determines the appropriate type
in many situations.
#>

$age = 25
$salary = 45000.50

$age
$salary


# ==========================================================
# 7. BOOLEAN VARIABLES
# ==========================================================

<#
Boolean values have only two possible values:

$true
$false

They are commonly used with conditions.
#>

$isAdmin = $true
$isLoggedIn = $false

$isAdmin
$isLoggedIn


# ==========================================================
# 8. ARRAYS
# ==========================================================

<#
An array stores multiple values in a single variable.

Arrays are created using commas.

Example:

$colors = "Red", "Green", "Blue"
#>

$colors = "Red", "Green", "Blue"

$colors


# Access individual array elements.

$colors[0]
$colors[1]
$colors[2]


# ==========================================================
# 9. ARRAY INDEXING
# ==========================================================

<#
PowerShell arrays use zero-based indexing.

First element  = index 0
Second element = index 1
Third element  = index 2
#>

$numbers = 10, 20, 30, 40, 50

$numbers[0]
$numbers[2]
$numbers[4]


# ==========================================================
# 10. ARRAY LENGTH
# ==========================================================

<#
The .Count property tells us how many items are in an array.
#>

$fruits = "Apple", "Banana", "Mango"

$fruits.Count


# ==========================================================
# 11. HASH TABLES
# ==========================================================

<#
A hash table stores data as key/value pairs.

Syntax:

@{
    Key = Value
}

Hash tables are useful for storing related information.
#>

$user = @{
    Name = "John"
    Age = 30
    City = "Pune"
}

$user


# Access individual values.

$user["Name"]
$user["Age"]
$user["City"]


# ==========================================================
# 12. UPDATING VARIABLES
# ==========================================================

<#
A variable's value can be changed after it is created.
#>

$count = 10

$count = 20

$count


# ==========================================================
# 13. MATHEMATICAL OPERATIONS WITH VARIABLES
# ==========================================================

<#
Variables containing numbers can be used in calculations.

Common operators:

+   Addition
-   Subtraction
*   Multiplication
/   Division
%   Modulus
#>

$a = 10
$b = 5

$addition = $a + $b
$subtraction = $a - $b
$multiplication = $a * $b
$division = $a / $b
$remainder = $a % $b

$addition
$subtraction
$multiplication
$division
$remainder


# ==========================================================
# 14. INCREMENT AND DECREMENT
# ==========================================================

<#
You can increase or decrease a numeric variable.

++ increases by 1.
-- decreases by 1.
#>

$count = 10

$count++

$count


$count--

$count


# ==========================================================
# 15. COMPOUND ASSIGNMENT OPERATORS
# ==========================================================

<#
PowerShell supports operators such as:

+=
-=
*=
/=

These modify the existing value.
#>

$count = 10

$count += 5

$count


$count -= 2

$count


# ==========================================================
# 16. CHECKING VARIABLE TYPE
# ==========================================================

<#
The .GetType() method tells us the data type of a value.
#>

$name = "John"

$name.GetType()


$age = 25

$age.GetType()


$isAdmin = $true

$isAdmin.GetType()


# ==========================================================
# 17. EXPLICIT DATA TYPES
# ==========================================================

<#
PowerShell allows you to explicitly specify a variable type.

Examples:

[string]
[int]
[double]
[bool]

This can be useful when you want to enforce a specific type.
#>

[string]$userName = "John"

[int]$age = 30

[double]$salary = 50000.50

[bool]$isActive = $true


# ==========================================================
# 18. TYPE CONVERSION
# ==========================================================

<#
You can convert a value from one type to another.

Example:
A string containing a number can be converted to an integer.
#>

$stringNumber = "100"

$number = [int]$stringNumber

$number.GetType()


# ==========================================================
# 19. MULTIPLE VARIABLE ASSIGNMENT
# ==========================================================

<#
PowerShell supports assigning multiple variables in one statement.
#>

$a, $b, $c = 10, 20, 30

$a
$b
$c


# ==========================================================
# 20. SWAPPING VARIABLES
# ==========================================================

<#
PowerShell makes it easy to swap two variables.
#>

$x = 10
$y = 20

$x, $y = $y, $x

$x
$y


# ==========================================================
# 21. VARIABLE INTERPOLATION
# ==========================================================

<#
Variable interpolation means inserting a variable's value
inside a double-quoted string.

Use double quotes for interpolation.
#>

$name = "John"
$age = 25

$message = "My name is $name and I am $age years old."

$message


# ==========================================================
# 22. EXPRESSIONS INSIDE STRINGS
# ==========================================================

<#
When an expression needs to be evaluated inside a string,
use $( ).

Example:

"Total: $(10 + 20)"
#>

$a = 10
$b = 20

$message = "The total is $($a + $b)"

$message


# ==========================================================
# 23. ENVIRONMENT VARIABLES
# ==========================================================

<#
PowerShell provides access to operating system environment
variables through the $env: scope.

Examples:

$env:PATH
$env:USERNAME
$env:COMPUTERNAME

The available environment variables depend on your system.
#>

$env:USERNAME
$env:COMPUTERNAME
$env:PATH


# ==========================================================
# 24. CREATING AN ENVIRONMENT VARIABLE
# ==========================================================

<#
You can create or modify an environment variable for the
current PowerShell process.

Example:
$env:MY_VARIABLE = "Hello"

This normally affects the current process/session.
#>

$env:MY_VARIABLE = "Hello PowerShell"

$env:MY_VARIABLE


# ==========================================================
# 25. AUTOMATIC VARIABLES
# ==========================================================

<#
PowerShell provides several automatic variables.

Examples include:

$HOME
$PWD
$PSVersionTable
$?
$_

These variables are created and managed by PowerShell.
#>

$HOME
$PWD
$PSVersionTable


# ==========================================================
# 26. READ-ONLY VARIABLES
# ==========================================================

<#
You can create a variable that cannot normally be changed
after creation.

Use New-Variable with the ReadOnly option.
#>

New-Variable -Name ServerName -Value "SERVER01" -Option ReadOnly

$ServerName


# ==========================================================
# 27. CONSTANT VARIABLES
# ==========================================================

<#
A constant variable cannot be changed after it is created.

Use New-Variable with the Constant option.
#>

New-Variable -Name CompanyName -Value "ExampleCorp" -Option Constant

$CompanyName


# ==========================================================
# 28. REMOVING VARIABLES
# ==========================================================

<#
Use Remove-Variable to delete a variable.

Syntax:

Remove-Variable variableName
#>

$temp = "Temporary value"

$temp

Remove-Variable temp


# ==========================================================
# 29. CHECKING WHETHER A VARIABLE EXISTS
# ==========================================================

<#
Get-Variable can be used to retrieve variables.

Example:

Get-Variable -Name name
#>

$testVariable = "Hello"

Get-Variable -Name testVariable


# ==========================================================
# 30. LISTING VARIABLES
# ==========================================================

<#
Get-Variable without a specific name displays variables
available in the current scope.
#>

Get-Variable


# ==========================================================
# 31. VARIABLES AND COMMAND OUTPUT
# ==========================================================

<#
PowerShell commands return objects.

The output of a command can be stored in a variable.
#>

$files = Get-ChildItem

$files


# ==========================================================
# 32. STORING COMMAND OUTPUT
# ==========================================================

<#
A variable can contain the output of almost any PowerShell
command.
#>

$currentDirectory = Get-Location

$currentDirectory


# ==========================================================
# 33. NULL VALUES
# ==========================================================

<#
$null represents the absence of a value.

It is useful when a variable should have no value.
#>

$result = $null

$result


# ==========================================================
# 34. CHECKING FOR NULL
# ==========================================================

<#
You can compare a variable with $null.

The recommended style is generally:

$null -eq $variable
#>

$value = $null

$null -eq $value


# ==========================================================
# 35. VARIABLE SCOPE - BASIC IDEA
# ==========================================================

<#
Variables can exist in different scopes.

Common scopes include:

$local:
$global:
$script:
$private:

A variable created normally is generally local to the
current scope.
#>

$localVariable = "Local Value"

$localVariable


# ==========================================================
# 36. GLOBAL VARIABLES
# ==========================================================

<#
The $global: scope can be used to create or access a variable
in the global scope.
#>

$global:MyGlobalVariable = "Global Value"

$global:MyGlobalVariable


# ==========================================================
# 37. SCRIPT VARIABLES
# ==========================================================

<#
The $script: scope refers to the scope of the current script.

This is especially useful inside functions and scripts.
#>

$script:ScriptVariable = "Script Value"

$script:ScriptVariable


# ==========================================================
# 38. PRACTICAL EXAMPLE
# ==========================================================

<#
A simple example using multiple variables.
#>

$employeeName = "Rahul"
$employeeAge = 28
$employeeCity = "Pune"
$employeeSalary = 60000
$employeeIsActive = $true

Write-Host "Employee Name: $employeeName"
Write-Host "Employee Age: $employeeAge"
Write-Host "Employee City: $employeeCity"
Write-Host "Employee Salary: $employeeSalary"
Write-Host "Employee Active: $employeeIsActive"


# ==========================================================
# 39. PRACTICAL ARRAY EXAMPLE
# ==========================================================

<#
Store multiple programming languages in an array.
#>

$languages = "PowerShell", "Python", "JavaScript", "C#"

foreach ($language in $languages) {
    Write-Host "Language: $language"
}


# ==========================================================
# 40. PRACTICAL HASH TABLE EXAMPLE
# ==========================================================

<#
Store employee information using a hash table.
#>

$employee = @{
    Name   = "Rahul"
    Age    = 28
    City   = "Pune"
    Role   = "PowerShell Developer"
    Active = $true
}

Write-Host "Name: $($employee.Name)"
Write-Host "Age: $($employee.Age)"
Write-Host "City: $($employee.City)"
Write-Host "Role: $($employee.Role)"
Write-Host "Active: $($employee.Active)"


# ==========================================================
# QUICK REFERENCE
# ==========================================================

<#
VARIABLE:

$name = "John"

STRING:

$name = "John"

NUMBER:

$age = 25

BOOLEAN:

$isActive = $true

ARRAY:

$colors = "Red", "Green", "Blue"

HASH TABLE:

$user = @{
    Name = "John"
    Age = 25
}

ENVIRONMENT VARIABLE:

$env:USERNAME

CHECK TYPE:

$name.GetType()

REMOVE VARIABLE:

Remove-Variable name

GET VARIABLE:

Get-Variable

NULL:

$value = $null

GLOBAL VARIABLE:

$global:name = "John"

SCRIPT VARIABLE:

$script:name = "John"

===========================================================
END OF BASIC VARIABLES
===========================================================
#>
