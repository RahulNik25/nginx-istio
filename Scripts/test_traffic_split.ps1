# Define the array to hold the URIs
$uri = $args[0]
$uris = @()

# Generate 100 URIs
for ($i = 1; $i -le 100; $i++) {
    $uris += $uri
}

# Create jobs for parallel processing
$jobs = @()
foreach ($uri in $uris) {
    $jobs += Start-Job -ScriptBlock {
        param($Uri)
        Invoke-WebRequest -Uri $Uri | Out-Null
    } -ArgumentList $uri
}
