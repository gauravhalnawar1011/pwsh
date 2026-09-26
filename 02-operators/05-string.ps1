#requires -Version 5.1

<#
.SYNOPSIS
    PowerShell String Operators - Complete Learning Script

.DESCRIPTION
    This script demonstrates PowerShell string operators and related
    string manipulation techniques.

    IMPORTANT:
    - Explanations are written as comments.
    - PowerShell commands are intentionally uncommented so they can execute.
    - Each section demonstrates a specific concept.
    - Run the entire script or execute individual sections in VS Code / ISE.

    Main operators covered:

        -eq          Equal
        -ne          Not equal
        -like        Wildcard matching
        -notlike     Negative wildcard matching
        -match       Regular expression matching
        -notmatch    Negative regex matching
        -replace     Replace text using regex
        -contains    Collection contains exact item
        -notcontains Collection does not contain exact item
        -in          Value exists in collection
        -notin       Value does not exist in collection
        -split       Split a string
        -join        Join strings

    Also covered:

        -ceq / -cne / -clike / -cmatch / -creplace
        -ieq / -ilike
        String concatenation
        String interpolation
        Single vs double quotes
        Regular expressions
        $Matches
        Practical filename examples
        Log processing
        Collection filtering
#>


# ============================================================
# 1. POWERSHELL STRING OPERATORS
# ============================================================

<#
CONCEPT

String operators are used to:

    - Compare strings
    - Search text
    - Match patterns
    - Replace text
    - Work with collections
    - Split strings
    - Join strings
    - Build strings

The most important operators are:

    -eq          Equal
    -ne          Not equal
    -like        Wildcard matching
    -notlike     Negative wildcard matching
    -match       Regular-expression matching
    -notmatch    Negative regex matching
    -replace     Replace text
    -contains    Collection contains an exact item
    -notcontains Collection does not contain an exact item
    -in          Value exists in a collection
    -notin       Value does not exist in a collection
    -split       Split a string
    -join        Join strings
#>


# ============================================================
# 2. -eq — EQUAL
# ============================================================

<#
CONCEPT

-eq means "equal to".

PowerShell string comparisons are case-insensitive by default.

Example:

    "Hello" -eq "Hello"

returns:

    True
#>

"Hello" -eq "Hello"

$name = "John"

$name -eq "John"

# PowerShell is normally case-insensitive.
"Hello" -eq "hello"

# Case-sensitive comparison uses -ceq.
"Hello" -ceq "hello"


<#
USEFUL COMPARISON OPERATORS

    -eq     Case-insensitive equal
    -ceq    Case-sensitive equal

    -ne     Case-insensitive not equal
    -cne    Case-sensitive not equal
#>

"Hello" -eq "hello"
"Hello" -ceq "hello"


# ============================================================
# 3. -ne — NOT EQUAL
# ============================================================

<#
CONCEPT

-ne means "not equal".

The expression returns True when the two values are different.
#>

"Hello" -ne "World"

$status = "Stopped"

if ($status -ne "Running") {
    Write-Host "Service is not running"
}

# Case-sensitive version.
"Hello" -cne "hello"


# ============================================================
# 4. -like — WILDCARD MATCHING
# ============================================================

<#
CONCEPT

-like compares a string against a wildcard pattern.

Important wildcard characters:

    *   = zero or more characters
    ?   = exactly one character

Example:

    "PowerShell" -like "Power*"

The * can represent:

    Shell
#>

"PowerShell" -like "Power*"

"PowerShell" -like "*Shell"

"PowerShell" -like "*Shell*"

"PowerShell" -like "Power*"

"PowerShell" -like "Python*"


<#
The following examples demonstrate that * can represent
different amounts of text.
#>

"PowerShell" -like "*Power*"
"PowerShell" -like "*Shell*"
"PowerShell" -like "*werShe*"


# ============================================================
# 5. ? WILDCARD
# ============================================================

<#
CONCEPT

The ? wildcard represents exactly ONE character.

    c?t

matches:

    cat
    cot
    cut

but not:

    coat
#>

"cat" -like "c?t"

"cat" -like "c??"

"cat" -like "c????"


# ============================================================
# 6. -notlike
# ============================================================

<#
CONCEPT

-notlike is the opposite of -like.

It returns True when the string does NOT match the wildcard pattern.
#>

"PowerShell" -notlike "Python*"

$file = "report.txt"

if ($file -notlike "*.log") {
    Write-Host "This is not a log file"
}


# ============================================================
# 7. -match — REGULAR EXPRESSION MATCHING
# ============================================================

<#
CONCEPT

-match uses regular expressions (regex).

Regex is more powerful than wildcard matching.

Example:

    "PowerShell" -match "Shell"

returns:

    True
#>

"PowerShell" -match "Shell"

"Hello World" -match "World"

"Hello World" -match "Python"


<#
IMPORTANT DIFFERENCE

-like uses wildcards:

    "PowerShell" -like "Power*"

-match uses regular expressions:

    "PowerShell" -match "^Power"

Both can return True, but regex provides much more
advanced pattern matching.
#>

"PowerShell" -like "Power*"

"PowerShell" -match "^Power"


# ============================================================
# 8. REGEX WITH -match
# ============================================================

<#
CONCEPT

\d means a digit.

Therefore:

    \d

matches:

    0
    1
    2
    ...
    9
#>

"Server123" -match "\d"

<#
To check whether an entire string contains only digits:

    ^       Start of string
    \d      Digit
    +       One or more
    $       End of string
#>

"12345" -match "^\d+$"

"123abc" -match "^\d+$"


# ============================================================
# 9. COMMON REGEX PATTERNS
# ============================================================

<#
REGEX CHEAT SHEET

    \d      Digit
    \w      Word character
    \s      Whitespace
    .       Any character
    ^       Start of string
    $       End of string
    +       One or more
    *       Zero or more
    ?       Zero or one

Example:

    ^\d+$

means:

    Start
    One or more digits
    End

Therefore the entire string must contain only digits.
#>

"12345" -match "^\d+$"

"12345" -match "^\d+$"


# ============================================================
# 10. -notmatch
# ============================================================

<#
CONCEPT

-notmatch is the opposite of -match.

It returns True when the regular expression does NOT match.
#>

"PowerShell" -notmatch "Python"

$username = "john123"

if ($username -notmatch "^\w+$") {
    Write-Host "Invalid username"
}
else {
    Write-Host "Username contains valid word characters"
}


# ============================================================
# 11. -replace — REPLACE TEXT
# ============================================================

<#
CONCEPT

-replace replaces text.

Basic syntax:

    "old text" -replace "old", "new"
#>

"old text" -replace "old", "new"

"Hello World" -replace "World", "PowerShell"


# Store the result in a variable.

$text = "Hello World"

$newText = $text -replace "World", "PowerShell"

Write-Host $newText


# ============================================================
# 12. -replace USES REGEX
# ============================================================

<#
CONCEPT

-replace uses regular expressions.

For example:

    \d

matches digits.

Therefore:

    "User123" -replace "\d", ""

removes every digit.
#>

"User123" -replace "\d", ""

"abc123xyz456" -replace "\d+", ""


# ============================================================
# 13. REPLACE MULTIPLE SPACES
# ============================================================

<#
CONCEPT

\s+ means:

    One or more whitespace characters.

This is useful for converting multiple spaces into one space.
#>

$text = "Hello     World"

$text -replace "\s+", " "


# ============================================================
# 14. CASE-SENSITIVE -replace
# ============================================================

<#
CONCEPT

Normal -replace is case-insensitive.

Therefore both "HELLO" and "hello" can match "hello".

Use -creplace for case-sensitive replacement.
#>

"HELLO hello" -replace "hello", "Hi"

"HELLO hello" -creplace "hello", "Hi"


# ============================================================
# 15. -contains
# ============================================================

<#
CONCEPT

-contains is primarily used with collections.

It checks whether a collection contains an EXACT item.

It does NOT perform substring searching.
#>

$names = "John", "Peter", "David"

$names -contains "Peter"

$names -contains "Pet"


<#
IMPORTANT

This is NOT a substring search:

    "PowerShell" -contains "Shell"

For substring searching use:

    -like "*Shell*"

or:

    -match "Shell"
#>

"PowerShell" -contains "Shell"

"PowerShell" -like "*Shell*"

"PowerShell" -match "Shell"


# ============================================================
# 16. -notcontains
# ============================================================

<#
CONCEPT

-notcontains checks whether a collection does NOT contain
an exact item.
#>

$names = "John", "Peter", "David"

$names -notcontains "Alex"

$names -notcontains "John"


# ============================================================
# 17. -in
# ============================================================

<#
CONCEPT

-in reverses the direction of -contains.

Instead of:

    $names -contains "John"

you can write:

    "John" -in $names

This is often easier to read in if statements.
#>

$names = "John", "Peter", "David"

"Peter" -in $names

$name = "Peter"

if ($name -in "John", "Peter", "David") {
    Write-Host "User found"
}


# ============================================================
# 18. -notin
# ============================================================

<#
CONCEPT

-notin checks that a value is NOT present in a collection.
#>

$name = "Alex"

if ($name -notin "John", "Peter", "David") {
    Write-Host "User not found"
}


# ============================================================
# 19. -split
# ============================================================

<#
CONCEPT

-split breaks one string into multiple pieces.

Example:

    "Apple,Banana,Orange" -split ","

produces:

    Apple
    Banana
    Orange
#>

"Apple,Banana,Orange" -split ","


# Store the result.

$fruits = "Apple,Banana,Orange" -split ","

$fruits[0]

$fruits[1]

$fruits[2]


# ============================================================
# 20. SPLIT USING SPACE
# ============================================================

<#
CONCEPT

A space can be used as the delimiter.
#>

"Hello World PowerShell" -split " "


# ============================================================
# 21. SPLIT USING MULTIPLE SPACES
# ============================================================

<#
CONCEPT

-split also supports regex.

\s+ means one or more whitespace characters.

This allows us to split text containing multiple spaces.
#>

"Hello     World" -split "\s+"


# ============================================================
# 22. -join
# ============================================================

<#
CONCEPT

-join performs the opposite operation of -split.

It combines multiple strings into one string.
#>

"Apple","Banana","Orange" -join ","

"Hello","World" -join " "


# Another practical example.

$words = "PowerShell", "is", "awesome"

$sentence = $words -join " "

Write-Host $sentence


# ============================================================
# 23. STRING CONCATENATION
# ============================================================

<#
CONCEPT

The + operator is not technically a string operator,
but it is commonly used to concatenate strings.
#>

$firstName = "John"
$lastName = "Smith"

$fullName = $firstName + " " + $lastName

Write-Host $fullName


# ============================================================
# 24. STRING INTERPOLATION
# ============================================================

<#
CONCEPT

PowerShell can expand variables inside double-quoted strings.

This is called string interpolation.
#>

$name = "John"

"Hello $name"

$age = 25

"Age: $age"


# ============================================================
# 25. STRING INTERPOLATION WITH EXPRESSIONS
# ============================================================

<#
CONCEPT

For more complex expressions use:

    $()

Example:

    "Total = $($a + $b)"
#>

$a = 10
$b = 20

"Total = $($a + $b)"


# ============================================================
# 26. SINGLE QUOTES VS DOUBLE QUOTES
# ============================================================

<#
CONCEPT

This is very important in PowerShell.

Double quotes:

    "Hello $name"

expand variables.

Single quotes:

    'Hello $name'

do NOT expand variables.
#>

$name = "John"

"Hello $name"

'Hello $name'


# Using Write-Host.

Write-Host "Hello $name"

Write-Host 'Hello $name'


# ============================================================
# 27. CASE-SENSITIVE STRING OPERATORS
# ============================================================

<#
CONCEPT

PowerShell provides c-prefixed operators for case-sensitive
comparisons.

Normal operators:

    -eq
    -ne
    -like
    -notlike
    -match
    -notmatch
    -replace

Case-sensitive versions:

    -ceq
    -cne
    -clike
    -cnotlike
    -cmatch
    -cnotmatch
    -creplace
#>

"PowerShell" -eq "powershell"

"PowerShell" -ceq "powershell"


# ============================================================
# 28. CASE-SENSITIVE OPERATOR EXAMPLES
# ============================================================

"Hello" -eq "hello"

"Hello" -ceq "hello"

"Hello" -ne "hello"

"Hello" -cne "hello"

"PowerShell" -like "power*"

"PowerShell" -clike "power*"

"PowerShell" -match "powershell"

"PowerShell" -cmatch "powershell"


# ============================================================
# 29. CASE-INSENSITIVE "i" VERSIONS
# ============================================================

<#
CONCEPT

PowerShell also supports i-prefixed operators for explicitly
specifying case-insensitive behavior.

Examples:

    -ieq
    -ine
    -ilike
    -inotlike
    -imatch
    -inotmatch
    -ireplace

PowerShell string comparison is normally case-insensitive,
so these operators are often unnecessary.

They can still be useful when you want to make the intended
behavior explicit.
#>

"Hello" -ieq "hello"

"PowerShell" -ilike "power*"


# ============================================================
# 30. -contains VS -like VS -match
# ============================================================

<#
CONCEPT

These three operators are frequently confused.

Consider:

    $text = "PowerShell is powerful"

-contains is for collection membership.

-like is for wildcard pattern matching.

-match is for regular expressions.

Mental model:

    -contains  -> collection item
    -like      -> wildcard
    -match     -> regex
#>

$text = "PowerShell is powerful"

$text -contains "PowerShell"

$text -like "*PowerShell*"

$text -match "PowerShell"


# ============================================================
# 31. PRACTICAL EXAMPLE — VALIDATE A FILENAME
# ============================================================

<#
CONCEPT

Suppose we want to determine whether a filename is a PDF.

For a simple filename pattern, -like is easy to understand.

Pattern:

    *.pdf
#>

$file = "report.pdf"

if ($file -like "*.pdf") {
    Write-Host "PDF file"
}


# The regex equivalent.

if ($file -match "\.pdf$") {
    Write-Host "PDF file"
}


# ============================================================
# 32. PRACTICAL EXAMPLE — CHECK AN EMAIL
# ============================================================

<#
CONCEPT

-match is useful when we need a regular expression.

This example checks whether an email has a basic structure.

NOTE:

This is only a basic "valid-looking" check.
Real email validation is more complicated.
#>

$email = "john@example.com"

if ($email -match "^[^@\s]+@[^@\s]+\.[^@\s]+$") {
    Write-Host "Valid-looking email"
}
else {
    Write-Host "Invalid email"
}


# ============================================================
# 33. PRACTICAL EXAMPLE — REMOVE NUMBERS
# ============================================================

<#
CONCEPT

Use -replace with \d to remove digits from a string.
#>

$text = "ABC123XYZ456"

$result = $text -replace "\d", ""

Write-Host $result


# ============================================================
# 34. PRACTICAL EXAMPLE — EXTRACT NUMBERS
# ============================================================

<#
CONCEPT

-match can populate the automatic $Matches variable.

When the regex matches, $Matches[0] contains the text
that matched the pattern.
#>

$text = "Server123"

if ($text -match "\d+") {
    $Matches[0]
}


# Another example.

$text = "User ID: 12345"

if ($text -match "\d+") {
    Write-Host "ID = $($Matches[0])"
}


# ============================================================
# 35. PRACTICAL EXAMPLE — SEARCH LOG MESSAGES
# ============================================================

<#
CONCEPT

String operators are extremely useful when processing logs.

Example log:

    2026-09-26 ERROR Database connection failed

We can search for ERROR using -match or -like.
#>

$log = "2026-09-26 ERROR Database connection failed"

if ($log -match "ERROR") {
    Write-Host "An error was found"
}

if ($log -like "*ERROR*") {
    Write-Host "An error was found"
}


# ============================================================
# 36. PRACTICAL EXAMPLE — PROCESS MULTIPLE STRINGS
# ============================================================

<#
CONCEPT

PowerShell operators work very well with collections.

Here we have multiple filenames and filter only PDF files.
#>

$files = @(
    "report.pdf"
    "data.csv"
    "image.jpg"
    "backup.pdf"
)

$files | Where-Object { $_ -like "*.pdf" }


# Regex alternative.

$files | Where-Object { $_ -match "\.pdf$" }


# ============================================================
# 37. PRACTICAL EXAMPLE — SERVICE STATUS
# ============================================================

<#
CONCEPT

For exact values, -eq is generally the appropriate operator.
#>

$status = "Running"

if ($status -eq "Running") {
    Write-Host "Service is running"
}
else {
    Write-Host "Service is not running"
}


# ============================================================
# 38. PRACTICAL EXAMPLE — MENU SELECTION
# ============================================================

<#
CONCEPT

-in makes it easy to check whether a value exists in a list.

This:

    $choice -in "start", "stop", "restart"

is often easier to read than multiple -eq conditions.
#>

$choice = "start"

if ($choice -in "start", "stop", "restart") {
    Write-Host "Valid option"
}
else {
    Write-Host "Invalid option"
}


# Equivalent approach using -eq.

if (
    $choice -eq "start" -or
    $choice -eq "stop" -or
    $choice -eq "restart"
) {
    Write-Host "Valid option"
}


# ============================================================
# 39. COLLECTION OPERATOR EXAMPLES
# ============================================================

<#
CONCEPT

Collection operators are useful when checking whether a value
exists in a list.
#>

$items = "A", "B", "C"

$items -contains "B"

"B" -in $items

$items -notcontains "D"

"D" -notin $items


# ============================================================
# 40. STRING OPERATOR QUICK CHEAT SHEET
# ============================================================

<#
COMPARISON

    "abc" -eq "abc"
    "abc" -ne "xyz"

WILDCARD

    "PowerShell" -like "Power*"
    "PowerShell" -notlike "Python*"

REGEX

    "abc123" -match "\d+"
    "abc123" -notmatch "^123"

REPLACE

    "Hello World" -replace "World", "PowerShell"

COLLECTION

    $items -contains "B"
    "B" -in $items
    $items -notcontains "D"
    "D" -notin $items

SPLIT

    "A,B,C" -split ","

JOIN

    "A","B","C" -join ","

CASE-SENSITIVE

    "Hello" -ceq "hello"

STRING INTERPOLATION

    $name = "John"
    "Hello $name"
#>


# ============================================================
# 41. THE FIVE OPERATORS TO LEARN FIRST
# ============================================================

<#
If you are learning PowerShell, concentrate on these five first:

    -eq
    -like
    -match
    -replace
    -split

Mental model:

    -eq
        Is it equal?

    -like
        Does it match this wildcard pattern?

    -match
        Does it match this regex?

    -replace
        Change part of the string.

    -split
        Break the string apart.

These five operators cover a large amount of real-world
PowerShell scripting.
#>


# ============================================================
# 42. FIVE OPERATORS — COMPLETE EXAMPLE
# ============================================================

$text = "PowerShell123"

# Exact comparison.
$text -eq "PowerShell123"

# Wildcard matching.
$text -like "Power*"

# Regular expression matching.
$text -match "\d+"

# Remove the numbers.
$text -replace "\d+", ""

# Split a comma-separated string.
"PowerShell,Windows,Microsoft" -split ","


# ============================================================
# 43. REAL-WORLD STRING PROCESSING EXAMPLE
# ============================================================

<#
CONCEPT

The following example combines several operators.

Scenario:

    We have a list of server messages.

We want to:

    1. Find ERROR messages.
    2. Extract numbers.
    3. Remove unnecessary numbers.
    4. Process multiple strings.
#>

$logs = @(
    "Server01 INFO Backup completed"
    "Server02 ERROR Database failed"
    "Server03 INFO Backup completed"
    "Server04 ERROR Network unavailable"
)

$logs | Where-Object { $_ -match "ERROR" }


# ============================================================
# 44. EXTRACT SERVER NUMBER
# ============================================================

<#
CONCEPT

The regex:

    Server(\d+)

captures the server number.

The first capture group can be accessed using:

    $Matches[1]
#>

$log = "Server123 ERROR Database failed"

if ($log -match "Server(\d+)") {
    Write-Host "Server Number = $($Matches[1])"
}


# ============================================================
# 45. SPLIT LOG DATA
# ============================================================

<#
CONCEPT

Whitespace can be used to split structured text.

Example:

    Server01 INFO Backup completed
#>

$log = "Server01 INFO Backup completed"

$parts = $log -split "\s+"

$parts[0]
$parts[1]
$parts[2]
$parts[3]


# ============================================================
# 46. JOIN LOG DATA
# ============================================================

<#
CONCEPT

After processing individual pieces, -join can combine them again.
#>

$parts = "Server01", "INFO", "Backup", "completed"

$parts -join " "


# ============================================================
# 47. PRACTICAL FILE EXTENSION CHECK
# ============================================================

<#
CONCEPT

Different operators can solve the same problem.

For simple wildcard matching:

    -like "*.pdf"

For regex:

    -match "\.pdf$"

For most simple filename checks, -like is easier to read.
#>

$files = @(
    "report.pdf"
    "document.docx"
    "image.png"
    "manual.pdf"
)

foreach ($file in $files) {

    if ($file -like "*.pdf") {
        Write-Host "$file is a PDF"
    }
}


# ============================================================
# 48. PRACTICAL USER INPUT VALIDATION
# ============================================================

<#
CONCEPT

String operators can validate user input.

Here we check whether the input is one of a predefined
set of values.
#>

$userChoice = "start"

if ($userChoice -in "start", "stop", "restart") {
    Write-Host "Valid choice"
}
else {
    Write-Host "Invalid choice"
}


# ============================================================
# 49. PRACTICAL NUMERIC STRING VALIDATION
# ============================================================

<#
CONCEPT

Even though a value may be stored as a string, regex can
be used to determine whether it contains only digits.
#>

$inputValue = "12345"

if ($inputValue -match "^\d+$") {
    Write-Host "The value contains only digits"
}
else {
    Write-Host "The value is not numeric text"
}


# ============================================================
# 50. PRACTICAL USERNAME VALIDATION
# ============================================================

<#
CONCEPT

The following example allows only word characters.

    \w

matches letters, numbers and underscore.

The anchors make sure the entire string is checked.
#>

$username = "john123"

if ($username -match "^\w+$") {
    Write-Host "Username format is valid"
}
else {
    Write-Host "Username format is invalid"
}


# ============================================================
# 51. CASE-SENSITIVE VS CASE-INSENSITIVE
# ============================================================

<#
CONCEPT

By default:

    -eq
    -ne
    -like
    -match

are case-insensitive for strings.

Use c-prefixed versions when you need case-sensitive behavior.
#>

$expected = "PowerShell"
$actual = "powershell"

if ($actual -eq $expected) {
    Write-Host "Case-insensitive match"
}

if ($actual -ceq $expected) {
    Write-Host "Case-sensitive match"
}
else {
    Write-Host "Case-sensitive comparison failed"
}


# ============================================================
# 52. FINAL STRING OPERATOR DEMONSTRATION
# ============================================================

<#
CONCEPT

This final example demonstrates the major concepts together.
#>

$value = "PowerShell123"

# Equality.
$value -eq "PowerShell123"

# Inequality.
$value -ne "Python"

# Wildcard.
$value -like "Power*"

# Negative wildcard.
$value -notlike "Python*"

# Regex.
$value -match "\d+"

# Negative regex.
$value -notmatch "Python"

# Replace numbers.
$value -replace "\d+", ""

# Collection membership.
$values = "PowerShell", "Windows", "Linux"

$values -contains "PowerShell"

"PowerShell" -in $values

$values -notcontains "Python"

"Python" -notin $values

# Split.
"PowerShell,Windows,Microsoft" -split ","

# Join.
"PowerShell","Windows","Microsoft" -join ","


# ============================================================
# 53. FINAL MENTAL MODEL
# ============================================================

<#
REMEMBER:

    -eq
        Exact equality.

    -ne
        Not equal.

    -like
        Wildcard matching.

    -notlike
        Does not match wildcard.

    -match
        Regular-expression matching.

    -notmatch
        Does not match regex.

    -replace
        Replace text using regex.

    -contains
        Collection contains an exact item.

    -notcontains
        Collection does not contain an exact item.

    -in
        Value exists in a collection.

    -notin
        Value does not exist in a collection.

    -split
        Break a string into pieces.

    -join
        Combine strings.

    + 
        String concatenation.

    "$variable"
        String interpolation.

    $()
        Expression inside a string.

    -ceq / -cne / -clike / -cmatch / -creplace
        Case-sensitive variants.

    -ieq / -ilike / etc.
        Explicit case-insensitive variants.


THE MOST IMPORTANT DISTINCTION:

    -contains
        Collection membership.

    -like
        Wildcard pattern matching.

    -match
        Regex pattern matching.


FIVE OPERATORS TO MASTER FIRST:

    -eq
    -like
    -match
    -replace
    -split


These operators are especially useful when working with:

    - Filenames
    - Logs
    - CSV data
    - User input
    - Services
    - System administration
    - Automation
    - Configuration files
    - Text processing
#>


# ============================================================
# END OF SCRIPT
# ============================================================

Write-Host ""
Write-Host "PowerShell String Operators lesson completed." -ForegroundColor Green
