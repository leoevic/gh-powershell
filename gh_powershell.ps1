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