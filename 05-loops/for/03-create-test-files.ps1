# #############################################################################
# Example 3 — Create numbered test files
# Real-life scenario: Create test files while testing storage or file-processing automation.
# #############################################################################

$path = "C:\Temp\ForLoopTest"

New-Item -Path $path -ItemType Directory -Force | Out-Null

for ($i = 1; $i -le 5; $i++) {
    $file = Join-Path $path "test-$i.txt"
    New-Item -Path $file -ItemType File -Force | Out-Null
    Write-Output "Created: $file"
}
