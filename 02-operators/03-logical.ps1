<#
## PowerShell Logical Operators

 Logical operators are used to **combine or reverse conditions**. They return `$true` or `$false`.

 ### 1\. `-and`

 Both conditions must be `$true`.
#>

$age = 25
$hasLicense = $true

if ($age -ge 18 -and $hasLicense) {
    Write-Host "You can drive"
}

<#
 Result:


You can drive


 Think:


TRUE -and TRUE  = TRUE
TRUE -and FALSE = FALSE
FALSE -and TRUE = FALSE
FALSE -and FALSE = FALSE


---
#>
<#
 ### 2\. `-or`

 At least **one** condition must be `$true`.


$day = "Saturday"

if ($day -eq "Saturday" -or $day -eq "Sunday") {
    Write-Host "It's the weekend"
}


 Result:


It's the weekend


 Think:


TRUE  -or TRUE  = TRUE
TRUE  -or FALSE = TRUE
FALSE -or TRUE  = TRUE
FALSE -or FALSE = FALSE

#>
##################################################################
 ### 3\. `-not`
##################################################################




$isLoggedIn = $false

if (-not $isLoggedIn) {
    Write-Host "Please login"
}

<#
 Result:


Please login


 Because:


-not TRUE  = FALSE
-not FALSE = TRUE


 You can also use `!`:


$isLoggedIn = $false

if (!$isLoggedIn) {
    Write-Host "Please login"
}


---
#>

<#
 ### 4\. Combining logical operators

 You can combine multiple conditions:


$age = 25
$hasID = $true
$isMember = $false

if (($age -ge 18 -and $hasID) -or $isMember) {
    Write-Host "Access granted"
}


 Here:


(age >= 18 AND hasID) OR isMember


 is evaluated.

 ### Quick reference

 | Operator | Meaning | Example |
| --- | --- | --- |
| `-and` | Both must be true | `$age -ge 18 -and $hasID` |
| `-or` | At least one true | `$isAdmin -or $isManager` |
| `-not` | Reverse true/false | `-not $isLoggedIn` |
| `!` | Short form of `-not` | `!$isLoggedIn` |

### Simple practice example


$age = 20
$country = "India"

if ($age -ge 18 -and $country -eq "India") {
    Write-Host "Eligible"
}
else {
    Write-Host "Not eligible"
}
#>

