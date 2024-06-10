<#
This is the GitHub Powershell script

Entry script

Copyright 2024 Leonardo Evic
#>

# Show first half of logo
Write-Host "gh-"

# Try to make a connection to GitHub
$loginParams = @{
    Uri = 'https://api.github.com/feeds'
    Headers = @{
        "Authorization" = "Bearer $apiKey";
        "X-GitHub-Api-Version" = "2022-11-28";
    }
    SessionVariable = 'Session'
}

$response = Invoke-WebRequest @loginParams

# Check if it worked
if ($response.StatusCode -ne "200") {
    Write-Host "Connection did not succeed." -ForegroundColor Red
    exit
}

Write-Host "Connection to GitHub.com succeeded." -ForegroundColor Green

$user = $response.Content | ConvertFrom-Json
$user

# Ask the user what he wants to do
Write-Host
"1 - List public repositories
2 - List commits
3 - List organizations"

$input = Read-Host "Please select an option"

$output = ""
switch ($input) {
    1 {
        $webParams = @{
            Uri = 'https://api.github.com/repositories'
            Headers = @{
                "Authorization" = "Bearer $apiKey";
                "X-GitHub-Api-Version" = "2022-11-28"
            }
        }
        $response = Invoke-WebRequest @webParams
        $data = $response.Content | ConvertFrom-Json
        $data | Foreach-Object {
            $_.full_name
        }
    }
}

# $output
