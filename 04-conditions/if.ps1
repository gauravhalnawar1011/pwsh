# Basic syntax
<#
if (condition) {
    # code
}

#>

$age = 25

if ($age -ge 18) {
    Write-Output "You are an adult"
}

# if / else

$age = 15

if ($age -ge 18) {
    Write-Output "You can vote"
}
else {
    Write-Output "You cannot vote"
}

#3. if / elseif / else

$marks = 75

if ($marks -ge 90) {
    Write-Output "Grade A+"
}
elseif ($marks -ge 75) {
    Write-Output "Grade A"
}
elseif ($marks -ge 60) {
    Write-Output "Grade B"
}
else {
    Write-Output "Grade C"
}

<# 
Comparison operators

This is very important in PowerShell.

Operator	Meaning	Example
-eq	Equal	$a -eq 10
-ne	Not equal	$a -ne 10
-gt	Greater than	$a -gt 10
-ge	Greater than or equal	$a -ge 10
-lt	Less than	$a -lt 10
-le	Less than or equal	$a -le 10
-like	Wildcard match	$name -like "G*"
-notlike	Doesn't wildcard match	$name -notlike "G*"
-match	Regex match	$name -match "^G"
-contains	Collection contains value	$list -contains "AWS"
-in	Value exists in collection	"AWS" -in $list

#>

