# #############################################################################
# Example 17 — Check multiple HTTP endpoints
# Real-life scenario: Perform a basic availability check against known application URLs.
# #############################################################################

$urls = @(
    "https://example.com",
    "https://www.microsoft.com"
)

for ($i = 0; $i -lt $urls.Count; $i++) {
    $url = $urls[$i]

    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -TimeoutSec 10 -ErrorAction Stop
        Write-Output "$url -> HTTP $($response.StatusCode)"
    }
    catch {
        Write-Output "$url -> FAILED: $($_.Exception.Message)"
    }
}
