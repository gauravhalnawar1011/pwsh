
# -----------------------------------------------
# PowerShell String Operations Demonstration
# -----------------------------------------------

# Define variables
$myVar = "hello world!"
$myVar2 = "WORLD"

# 1. String Length
$length = $myVar.Length
Write-Output "Length of myVar: $length"

# 2. Convert to Uppercase
$upper = $myVar.ToUpper()
Write-Output "Uppercase: $upper"

# 3. Convert to Lowercase
$lower = $myVar2.ToLower()
Write-Output "Lowercase: $lower"

# 4. Replace Substring
$replace = $myVar.Replace("world", "friends")
Write-Output "After Replacement: $replace"

# 5. String Slicing
$slice = $myVar.Substring(0, 5)
Write-Output "Sliced String: $slice"

# 6. String Concatenation
$concat = "$myVar $myVar2"
Write-Output "Concatenation: $concat"

# 7. Index of Substring
# PowerShell uses zero-based indexing
$pos = $myVar.IndexOf("world")

# Add 1 if you want the same 1-based position as Bash expr index
$pos = $pos + 1
Write-Output "Position of 'world': $pos"

# 8. Remove Prefix
$prefix_removed = $myVar -replace "^hello", ""
Write-Output "Prefix Removed: $prefix_removed"

# 9. Remove Suffix
$suffix_removed = $myVar -replace "!$", ""
Write-Output "Suffix Removed: $suffix_removed"

# 10. Trim Leading/Trailing Whitespace
$trimmed = "   hello   ".Trim()
Write-Output "Trimmed String: '$trimmed'"

# 11. Reverse a String
$reversed = -join $myVar.ToCharArray()[($myVar.Length - 1)..0]
Write-Output "Reversed String: $reversed"

# 12. Compare Strings
if ($myVar -eq "hello world!") {
    Write-Output "Comparison: Strings are equal"
}
else {
    Write-Output "Comparison: Strings are NOT equal"
}

# 13. Check if String Contains Substring
if ($myVar -like "*world*") {
    Write-Output "Contains Check: myVar contains 'world'"
}

# 14. String Null/Empty Check
$emptyStr = ""

if ([string]::IsNullOrEmpty($emptyStr)) {
    Write-Output "Empty Check: String is empty"
}

# 15. Repeat String
$repeat = "*" * 5
Write-Output "Repeated String: $repeat"

