#############################################################################
#Example 1 — Number is positive
#############################################################################
$num = 10

if ($num -gt 0) {
    Write-Output "Positive number"
}
#############################################################################
#Example 2 — Positive, negative, or zero
#############################################################################
$num = -5

if ($num -gt 0) {
    Write-Output "Positive"
}
elseif ($num -lt 0) {
    Write-Output "Negative"
}
else {
    Write-Output "Zero"
}

#############################################################################
#Example 3 — Even or odd
#############################################################################
$num = 10

if ($num % 2 -eq 0) {
    Write-Output "Even"
}
else {
    Write-Output "Odd"
}
#############################################################################
#Example 4 — Check age
#############################################################################
$age = 25

if ($age -ge 18) {
    Write-Output "Adult"
}
else {
    Write-Output "Minor"
}
Example 5 — Check password
$password = "admin123"

if ($password -eq "admin123") {
    Write-Output "Correct password"
}
else {
    Write-Output "Incorrect password"
}

#For real applications, don't store plaintext passwords like this; this is only a basic if example.
#############################################################################
#Example 6 — Check file exists
#############################################################################

#This is very important for automation.

$file = "C:\Temp\test.txt"

if (Test-Path $file -PathType Leaf) {
    Write-Output "File exists"
}
else {
    Write-Output "File does not exist"
}
#############################################################################
#Example 7 — Check directory exists
#############################################################################
$path = "C:\Backup"

if (Test-Path $path -PathType Container) {
    Write-Output "Directory exists"
}
else {
    Write-Output "Directory does not exist"
}
#############################################################################
#Example 8 — Create directory if missing
#############################################################################

# Very useful in DevOps scripts.

$path = "C:\Backup"

if (-not (Test-Path $path -PathType Container)) {
    New-Item -Path $path -ItemType Directory
    Write-Output "Directory created"
}
else {
    Write-Output "Directory already exists"
}


#############################################################################
#Example 9 — Check service status
#############################################################################

$service = Get-Service -Name "wuauserv"

if ($service.Status -eq "Running") {
    Write-Output "Windows Update service is running"
}
else {
    Write-Output "Windows Update service is not running"
}
#############################################################################
#Example 10 — Start service if stopped
#############################################################################

$service = Get-Service -Name "wuauserv"

if ($service.Status -ne "Running") {
    Start-Service -Name "wuauserv"
    Write-Output "Service started"
}
else {
    Write-Output "Service is already running"
}

#############################################################################
#11. Check disk space
#############################################################################


$freeSpace = 15

if ($freeSpace -lt 10) {
    Write-Output "WARNING: Low disk space"
}
else {
    Write-Output "Disk space is OK"
}
#############################################################################
#12. Check CPU usage
#############################################################################
$cpu = 85

if ($cpu -ge 90) {
    Write-Output "CRITICAL: CPU usage is very high"
}
elseif ($cpu -ge 70) {
    Write-Output "WARNING: CPU usage is high"
}
else {
    Write-Output "CPU usage is normal"
}

#############################################################################
#13. Check environment
#############################################################################

$environment = "Production"

if ($environment -eq "Production") {
    Write-Output "Deploying to Production"
}
elseif ($environment -eq "Staging") {
    Write-Output "Deploying to Staging"
}
else {
    Write-Output "Unknown environment"
}
#############################################################################
#14. Check Azure environment variable
#############################################################################

$environment = $env:ENVIRONMENT

if ($environment -eq "Production") {
    Write-Output "Production deployment"
}
else {
    Write-Output "Non-production deployment"
}

#This type of logic is useful in Azure DevOps pipelines.

#############################################################################
#15. Multiple conditions with -and
#############################################################################
$age = 25
$hasLicense = $true

if (($age -ge 18) -and ($hasLicense -eq $true)) {
    Write-Output "Allowed to drive"
}
else {
    Write-Output "Not allowed"
}

# -and means both conditions must be true.
#############################################################################
#16. Multiple conditions with -or
#############################################################################
$day = "Saturday"

if (($day -eq "Saturday") -or ($day -eq "Sunday")) {
    Write-Output "Weekend"
}
else {
    Write-Output "Working day"
}

#-or means at least one condition must be true.

#############################################################################
#17. Check username
#############################################################################

$username = $env:USERNAME

if ($username -eq "Administrator") {
    Write-Output "Administrator account"
}
else {
    Write-Output "Standard user account"
}
#############################################################################
#18. Check file size
#############################################################################

$file = "C:\Temp\log.txt"

if (Test-Path $file -PathType Leaf) {

    $size = (Get-Item $file).Length

    if ($size -gt 100MB) {
        Write-Output "WARNING: File is larger than 100 MB"
    }
    else {
        Write-Output "File size is OK"
    }
}
else {
    Write-Output "File does not exist"
}

#This is a good example of nested if statements.

#############################################################################
#19. Check Kubernetes pod status
#############################################################################

#This is directly useful for your DevOps work.

$status = "Running"

if ($status -eq "Running") {
    Write-Output "Pod is healthy"
}
elseif ($status -eq "Pending") {
    Write-Output "Pod is waiting"
}
elseif ($status -eq "Failed") {
    Write-Output "Pod has failed"
}
else {
    Write-Output "Unknown pod status"
}
#############################################################################
#20. Terraform deployment decision
#############################################################################

#A practical DevOps example:

$environment = "Production"

if ($environment -eq "Production") {

    Write-Output "Running Terraform plan for Production"

    terraform plan

}
elseif ($environment -eq "Staging") {

    Write-Output "Running Terraform plan for Staging"

    terraform plan -var-file="staging.tfvars"

}
else {

    Write-Output "Invalid environment"
    exit 1
}

#This introduces an important DevOps concept:

#exit 1

#A non-zero exit code can indicate failure to CI/CD systems.