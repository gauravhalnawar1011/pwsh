# #############################################################################
# Example 10 — Check common service ports
# Real-life scenario: Test whether common DevOps service ports are reachable.
# #############################################################################

$ports = 22, 80, 443, 5985, 5986

for ($i = 0; $i -lt $ports.Count; $i++) {
    $port = $ports[$i]

    Write-Output "Checking port $port..."

    Test-NetConnection -ComputerName "localhost" -Port $port -InformationLevel Quiet
}
