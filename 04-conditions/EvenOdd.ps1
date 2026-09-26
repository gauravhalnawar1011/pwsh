$num = 10

if ($num % 2 -eq 0) {
    Write-Host "$num is even"
}
else {
    Write-Host "$num is odd"
}

<#
How it works
% gives the remainder.

$num % 2 -eq 0 → even

Otherwise → odd

For example, with $num = 7, the output is:

#>



$num = -5

if ($num -gt 0) {
    Write-Host "$num is positive"
}
elseif ($num -lt 0) {
    Write-Host "$num is negative"
}
else {
    Write-Host "$num is zero"
}
