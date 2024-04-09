# Define the API URL and fetch the latest release information
$apiURL = "https://api.github.com/repos/tm-ahad/cream/releases/latest"
$output = Invoke-RestMethod -Uri $apiURL

# Extract the download URL for the cream executable
$downloadURL = $output.assets | Where-Object { $_.name -match "cream-windows.exe" } | Select-Object -ExpandProperty browser_download_url

# Create the directory if it doesn't exist
$installDir = "C:\.cream\bin"
if (-not (Test-Path -Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force
}

# Download the cream executable
$outputFilePath = Join-Path -Path $installDir -ChildPath "cream.exe"
Invoke-WebRequest -Uri $downloadURL -OutFile $outputFilePath

Write-Host "cream has been successfully downloaded on your machine!"
Write-Host "Now append this path ($installDir) to the PATH env var"
