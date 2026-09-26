# #############################################################################
# Example 2 — Keep accepting input until the user chooses to exit
# Real-life scenario: Build a simple interactive administration tool.
# #############################################################################

do {
    $choice = Read-Host "Enter a value or type exit"

    if ($choice -ne "exit") {
        Write-Output "You entered: $choice"
    }
}
while ($choice -ne "exit")

Write-Output "Program ended."
