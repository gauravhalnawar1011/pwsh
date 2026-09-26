#requires -Version 5.1

<#
.SYNOPSIS
    PowerShell Assignment Operators - Learning Script

.DESCRIPTION
    This script demonstrates PowerShell assignment operators.

    Assignment operators are used to:
        - Assign values to variables
        - Add to a variable
        - Subtract from a variable
        - Multiply a variable
        - Divide a variable
        - Calculate modulus
        - Raise a value to a power

    Operators covered:

        =       Assignment
        +=      Add and assign
        -=      Subtract and assign
        *=      Multiply and assign
        /=      Divide and assign
        %=      Modulus and assign
        **=     Power and assign

    IMPORTANT:
        - Concepts and explanations are comments.
        - Executable PowerShell commands are intentionally uncommented.
        - Expected output is documented in comments.
#>


# ============================================================
# 1. BASIC ASSIGNMENT OPERATOR
# ============================================================

<#
CONCEPT

The = operator assigns a value to a variable.

Syntax:

    $variable = value

Example:

    $a = 10

This means:

    Store the value 10 inside variable $a.
#>

$a = 10

$a

# Expected output:
# 10


# ============================================================
# 2. CHANGE AN EXISTING VALUE
# ============================================================

<#
CONCEPT

A variable can be assigned a new value at any time.

The previous value is replaced.
#>

$a = 20

$a

# Expected output:
# 20


# ============================================================
# 3. += ADD AND ASSIGN
# ============================================================

<#
CONCEPT

The += operator means:

    Add a value to the existing variable
    and store the result back in the variable.

Instead of:

    $a = $a + 5

We can write:

    $a += 5
#>

$a += 5

$a

# Expected output:
# 25


<#
Internally:

    $a += 5

is equivalent to:

    $a = $a + 5

Current value:

    20

Calculation:

    20 + 5 = 25
#>


# ============================================================
# 4. -= SUBTRACT AND ASSIGN
# ============================================================

<#
CONCEPT

The -= operator subtracts a value from the existing variable
and stores the result back in the variable.

Equivalent to:

    $a = $a - 5
#>

$a -= 5

$a

# Expected output:
# 20


<#
Calculation:

    25 - 5 = 20
#>


# ============================================================
# 5. *= MULTIPLY AND ASSIGN
# ============================================================

<#
CONCEPT

The *= operator multiplies the existing value and stores
the result back into the variable.

Equivalent to:

    $a = $a * 2
#>

$a *= 2

$a

# Expected output:
# 40


<#
Calculation:

    20 * 2 = 40
#>


# ============================================================
# 6. /= DIVIDE AND ASSIGN
# ============================================================

<#
CONCEPT

The /= operator divides the existing value and stores
the result back into the variable.

Equivalent to:

    $a = $a / 2
#>

$a /= 2

$a

# Expected output:
# 20


<#
Calculation:

    40 / 2 = 20
#>


# ============================================================
# 7. %= MODULUS AND ASSIGN
# ============================================================

<#
CONCEPT

The %= operator calculates the remainder after division
and stores the result back into the variable.

Equivalent to:

    $a = $a % 3

Example:

    20 / 3

Quotient:

    6

Remainder:

    2

Therefore:

    20 % 3 = 2
#>

$a %= 3

$a

# Expected output:
# 2


# ============================================================
# 8. **= POWER AND ASSIGN
# ============================================================

<#
CONCEPT

The **= operator raises the existing value to a power
and stores the result.

Equivalent to:

    $a = $a ** 3

For example:

    2 ** 3

means:

    2 × 2 × 2

which equals:

    8
#>

#$a **= 3

$a

# Expected output:
# 8


# ============================================================
# 9. ASSIGNMENT OPERATOR SUMMARY
# ============================================================

<#
PowerShell assignment operators:

    =

        Assign a value.

        Example:
            $a = 10


    +=

        Add and assign.

        Example:
            $a += 5

        Equivalent:
            $a = $a + 5


    -=

        Subtract and assign.

        Example:
            $a -= 5

        Equivalent:
            $a = $a - 5


    *=

        Multiply and assign.

        Example:
            $a *= 2

        Equivalent:
            $a = $a * 2


    /=

        Divide and assign.

        Example:
            $a /= 2

        Equivalent:
            $a = $a / 2


    %=

        Modulus and assign.

        Example:
            $a %= 3

        Equivalent:
            $a = $a % 3


    **=

        Power and assign.

        Example:
            $a **= 3

        Equivalent:
            $a = $a ** 3
#>


# ============================================================
# 10. ASSIGNMENT OPERATOR TABLE
# ============================================================

<#
OPERATOR       MEANING                  EQUIVALENT

    =          Assignment              $a = 10

    +=         Add and assign           $a = $a + 5

    -=         Subtract and assign      $a = $a - 5

    *=         Multiply and assign      $a = $a * 2

    /=         Divide and assign        $a = $a / 2

    %=         Modulus and assign       $a = $a % 3

    **=        Power and assign         $a = $a ** 3
#>


# ============================================================
# 11. STRING ASSIGNMENT
# ============================================================

<#
CONCEPT

Assignment operators are not limited to numbers.

We can also assign strings to variables.

Example:

    $name = "Alice"
#>

$name = "Alice"

$name

# Expected output:
# Alice


# ============================================================
# 12. CHANGE STRING VALUE
# ============================================================

<#
CONCEPT

A variable can be assigned a completely new value.

The previous value is replaced.
#>

$name = "Bob"

$name

# Expected output:
# Bob


# ============================================================
# 13. STRING +=
# ============================================================

<#
CONCEPT

The += operator can also be used with strings.

For strings, += concatenates the new value.

Example:

    $name = "Alice"
    $name += " Smith"

Result:

    Alice Smith
#>

$name = "Alice"

$name += " Smith"

$name

# Expected output:
# Alice Smith


# ============================================================
# 14. STRING CONCATENATION WITH +=
# ============================================================

<#
CONCEPT

Using += with strings is equivalent to concatenating the
existing value with the new value.

Example:

    $message += " World"

is similar to:

    $message = $message + " World"
#>

$message = "Hello"

$message += " World"

$message

# Expected output:
# Hello World


# ============================================================
# 15. NUMBER EXAMPLE
# ============================================================

<#
CONCEPT

Assignment operators are particularly useful for counters,
calculations, totals, and values that change during a script.
#>

$count = 10

$count += 5

$count

# Expected output:
# 15


$count -= 3

$count

# Expected output:
# 12


$count *= 2

$count

# Expected output:
# 24


$count /= 4

$count

# Expected output:
# 6


# ============================================================
# 16. COMPLETE CALCULATION EXAMPLE
# ============================================================

<#
CONCEPT

Here we perform several operations on the same variable.

Starting value:

    10

Then:

    +5
    -3
    *2
    /4

This demonstrates how assignment operators modify the
existing value.
#>

$count = 10

$count += 5
$count

# Expected:
# 15

$count -= 3
$count

# Expected:
# 12

$count *= 2
$count

# Expected:
# 24

$count /= 4
$count

# Expected:
# 6


# ============================================================
# 17. MODULUS PRACTICAL EXAMPLE
# ============================================================

<#
CONCEPT

The modulus operator (%) returns the remainder.

Examples:

    10 % 3 = 1
    10 % 2 = 0
    15 % 4 = 3

This can be useful for determining whether a number is
even or odd.
#>

$number = 10

$number %= 3

$number

# Expected output:
# 1


# ============================================================
# 18. POWER PRACTICAL EXAMPLE
# ============================================================

<#
CONCEPT

The ** operator raises a number to a power.

For example:

    2 ** 3 = 8

    3 ** 2 = 9

Using **= modifies the existing variable.
#>

$number = 2

#$number **= 3

$number

# Expected output:
# 8


# ============================================================
# 19. COUNTER EXAMPLE
# ============================================================

<#
CONCEPT

+= is commonly used when creating counters.

For example, a counter can start at zero and increase
each time something happens.
#>

$counter = 0

$counter += 1
$counter += 1
$counter += 1

$counter

# Expected output:
# 3


# ============================================================
# 20. TOTAL EXAMPLE
# ============================================================

<#
CONCEPT

+= is also useful for calculating totals.

Here we start with zero and add several values.
#>

$total = 0

$total += 100
$total += 50
$total += 25

$total

# Expected output:
# 175


# ============================================================
# 21. DISCOUNT EXAMPLE
# ============================================================

<#
CONCEPT

Assignment operators can be used in simple calculations.

For example, suppose an item costs 100.

We can subtract a discount from the price.
#>

$price = 100

$price -= 20

$price

# Expected output:
# 80


# ============================================================
# 22. MULTIPLICATION EXAMPLE
# ============================================================

<#
CONCEPT

*= is useful when a value needs to be multiplied repeatedly.

Example:

    Quantity = 5
    Price = 10

    Total = 50
#>

$total = 5

$total *= 10

$total

# Expected output:
# 50


# ============================================================
# 23. DIVISION EXAMPLE
# ============================================================

<#
CONCEPT

/= is useful when distributing or reducing a value.

Example:

    100 / 4 = 25
#>

$value = 100

$value /= 4

$value

# Expected output:
# 25


# ============================================================
# 24. ASSIGNMENT IN A LOOP
# ============================================================

<#
CONCEPT

Assignment operators are very commonly used inside loops.

The following example increments a counter each time
the loop executes.
#>

$counter = 0

for ($i = 1; $i -le 5; $i++) {
    $counter += 1
}

$counter

# Expected output:
# 5


# ============================================================
# 25. CALCULATE A RUNNING TOTAL
# ============================================================

<#
CONCEPT

A running total can be created using +=.

This is a common pattern when processing collections,
files, records, or other data.
#>

$total = 0

$numbers = 10, 20, 30, 40, 50

foreach ($number in $numbers) {
    $total += $number
}

$total

# Expected output:
# 150


# ============================================================
# 26. ASSIGNMENT OPERATORS WITH VARIABLES
# ============================================================

<#
CONCEPT

The value on the right side can also come from another variable.
#>

$a = 10
$b = 5

$a += $b

$a

# Expected output:
# 15


# ============================================================
# 27. SUBTRACT USING ANOTHER VARIABLE
# ============================================================

$a = 20
$b = 5

$a -= $b

$a

# Expected output:
# 15


# ============================================================
# 28. MULTIPLY USING ANOTHER VARIABLE
# ============================================================

$a = 10
$b = 5

$a *= $b

$a

# Expected output:
# 50


# ============================================================
# 29. DIVIDE USING ANOTHER VARIABLE
# ============================================================

$a = 20
$b = 5

$a /= $b

$a

# Expected output:
# 4


# ============================================================
# 30. MODULUS USING ANOTHER VARIABLE
# ============================================================

$a = 20
$b = 6

$a %= $b

$a

# Expected output:
# 2


# ============================================================
# 31. POWER USING ANOTHER VARIABLE
# ============================================================

$a = 2
$b = 4

#$a **= $b

$a

# Expected output:
# 16


# ============================================================
# 32. QUICK CHEAT SHEET
# ============================================================

<#
ASSIGNMENT OPERATORS

    =

        Assign

        $a = 10


    +=

        Add and assign

        $a += 5

        Same as:

        $a = $a + 5


    -=

        Subtract and assign

        $a -= 5

        Same as:

        $a = $a - 5


    *=

        Multiply and assign

        $a *= 2

        Same as:

        $a = $a * 2


    /=

        Divide and assign

        $a /= 2

        Same as:

        $a = $a / 2


    %=

        Modulus and assign

        $a %= 3

        Same as:

        $a = $a % 3


    **=

        Power and assign

        $a **= 3

        Same as:

        $a = $a ** 3
#>


# ============================================================
# 33. FINAL DEMONSTRATION
# ============================================================

<#
CONCEPT

This final example demonstrates all the main assignment
operators in sequence.

Starting value:

    10
#>

$a = 10

# Assignment
$a = 20
$a

# Expected:
# 20


# Add and assign
$a += 5
$a

# Expected:
# 25


# Subtract and assign
$a -= 5
$a

# Expected:
# 20


# Multiply and assign
$a *= 2
$a

# Expected:
# 40


# Divide and assign
$a /= 2
$a

# Expected:
# 20


# Modulus and assign
$a %= 3
$a

# Expected:
# 2


# Power and assign
#$a **= 3
$a

# Expected:
# 8


# ============================================================
# 34. FINAL MENTAL MODEL
# ============================================================

<#
REMEMBER:

    =

        Put a value into a variable.

        $a = 10


    +=

        Take the current value,
        add something,
        save the result.

        $a += 5


    -=

        Take the current value,
        subtract something,
        save the result.

        $a -= 5


    *=

        Take the current value,
        multiply it,
        save the result.

        $a *= 2


    /=

        Take the current value,
        divide it,
        save the result.

        $a /= 2


    %=

        Take the current value,
        calculate the remainder,
        save the result.

        $a %= 3


    **=

        Take the current value,
        raise it to a power,
        save the result.

        $a **= 3


THE GENERAL PATTERN:

    $variable OP= value


is a shorter way of writing:

    $variable = $variable OP value


For example:

    $a += 5

means:

    $a = $a + 5


    $a -= 5

means:

    $a = $a - 5


    $a *= 5

means:

    $a = $a * 5


    $a /= 5

means:

    $a = $a / 5


    $a %= 5

means:

    $a = $a % 5


    $a **= 5

means:

    $a = $a ** 5


These operators are especially useful for:

    - Counters
    - Running totals
    - Calculations
    - Loops
    - Statistics
    - File processing
    - Data processing
    - Automation
    - System administration
#>


# ============================================================
# END OF SCRIPT
# ============================================================

Write-Host ""
Write-Host "PowerShell Assignment Operators lesson completed." -ForegroundColor Green