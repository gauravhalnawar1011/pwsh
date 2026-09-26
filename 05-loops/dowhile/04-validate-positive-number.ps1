# #############################################################################
# Example 4 — Ask until a positive number is entered
# Real-life scenario: Validate user input before using it in an automation task.
# #############################################################################

do {
    $inputValue = Read-Host "Enter a positive number"

    $number = 0
    $valid = [int]::TryParse($inputValue, [ref]$number)

    if (-not $valid -or $number -le 0) {
        Write-Output "Invalid input. Please enter a positive number."
    }
}
while (-not $valid -or $number -le 0)

Write-Output "Accepted value: $number"
