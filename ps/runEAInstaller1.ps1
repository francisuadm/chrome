# Function to download a file from a URL
function Download-File {
    param (
        [string]$url,
        [string]$output
    )
    try {
        Invoke-WebRequest -Uri $url -OutFile $output -ErrorAction Stop
        Write-Output "Downloaded $url to $output"
    } catch {
        Write-Output "Failed to download $url"
        throw
    }
}



# Download the batch file
iwr -Uri "https://raw.githubusercontent.com/francisuadm/chrome/main/ps/EnableAppInstaller.bat" -OutFile "C:\IT_Folder\EnableAppInstaller.bat"

# Run the batch file with elevated privileges
Start-Process -FilePath "C:\IT_Folder\EnableAppInstaller.bat" -Verb RunAs
