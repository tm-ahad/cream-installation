$url = "https://github.com/tm-ahad/cream/releases/download/v0.4.2-alpha/windows.exe"
$outputFile = "$env:USERPROFILE\Downloads\cream.exe"

try {
    Invoke-WebRequest -Uri $url -OutFile $outputFile -ErrorAction Stop
    $destinationDir = "$env:USERPROFILE\.cream"

    if (!(Test-Path -Path $destinationDir -PathType Container)) {
        New-Item -Path $destinationDir -ItemType Directory | Out-Null
    }

    Move-Item -Path $outputFile -Destination "$destinationDir\cream.exe" -Force
    $env:PATH += ";$destinationDir"

    Write-Host "cream has been successfully installed on your machine."
} 
catch {
    Write-Error "An error occurred while downloading or moving the file: $_"
}
