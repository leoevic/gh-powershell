<#
This is the GitHub Powershell script

Entry script

Copyright 2024 Leonardo Evic
#>

# Show first half of logo
Write-Host "gh-"

# This things are for later
<# Instantiate classes
$mainPath = (Get-Location).Path + "/classes/main.ps1"
. $mainPath

# Get important information
$main = [Main]::new()

Write-Host $apiKey

Write-Host #>

$apiKey = Get-Content .\api.key
Write-Host $apiKey

# Try to make a connection to GitHub
$loginParams = @{
    Uri = 'https://api.github.com/octocat'
    Headers = @{
        "Authorization" = "Bearer $apiKey";
        "X-GitHub-Api-Version" = "2022-11-28";
    }
    SessionVariable = 'Session'
}

$response = Invoke-WebRequest @loginParams

$response

$Session
