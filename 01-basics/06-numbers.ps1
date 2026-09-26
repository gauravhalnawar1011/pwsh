$num1 = [int](Read-Host "Enter an num1 value: ")
$num2 = [int](Read-Host "Enter an num2 value: ")

$result = $num1 + $num2 
$sub = $num1 - $num2
$mul = $num1 * $num2
$div = $num1 / $num2

Write-Output "the addition of $num1 + $num2 = $result"
Write-Output "the subtraction of $num1 - $num2 = $sub"
Write-Output "the multiplication of $num1 X $num2 = $mul"
Write-Output "the division of $num1  / $num2 = $div"
