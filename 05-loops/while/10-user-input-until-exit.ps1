# #############################################################################
# Example 10 — Keep accepting input until the user enters exit
# Real-life scenario: Build a simple interactive administration tool.
# #############################################################################

$inputValue = ""

while ($inputValue -ne "exit") {

    $inputValue = Read-Host "Enter a value or type 'exit'"

    if ($inputValue -ne "exit") {
        Write-Output "You entered: $inputValue"
    }
}

Write-Output "Program ended."
