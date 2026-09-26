# #############################################################################
# Example 18 — Copy a configuration file to multiple servers
# Real-life scenario: Distribute a common configuration file during deployment.
# #############################################################################

$servers = "server01", "server02", "server03"
$source = "C:\Deploy\appsettings.json"

foreach ($server in $servers) {
    $destination = "\\$server\C$\App\appsettings.json"

    if (Test-Path $source -PathType Leaf) {
        Copy-Item -Path $source -Destination $destination -Force
        Write-Output "Copied configuration to $server"
    }
    else {
        Write-Output "Source file not found: $source"
        break
    }
}
