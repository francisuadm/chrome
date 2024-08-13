# Define the directory to store the wireless profiles
$folderPath = "C:\IT_Folder\Wireless"
$fileExtension = "xml"

# Create the export directory if it doesn't exist
if (-not (Test-Path -Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

# Function to export all wireless profiles
function Export-WifiProfiles {
    Write-Host "Exporting all wireless profiles..."
    netsh wlan export profile folder=$folderPath key=clear
    Write-Host "All profiles have been exported successfully."
}

# Function to import wireless profiles
function Import-WifiProfiles {
    if (-not (Test-Path -Path $folderPath)) {
        Write-Host "The specified folder does not exist."
        return
    }
    
    Write-Host "We are going to import all the profiles in this folder!"
    $answer = Read-Host "Do you want to continue (Y/N)?"
    
    if ($answer -match '^[yY](es)?$') {
        Write-Host "Importing all profiles from $folderPath..."
        $files = Get-ChildItem -Path $folderPath -Filter "*.$fileExtension"
        
        if ($files.Count -eq 0) {
            Write-Host "No profile files found to import."
            return
        }
        
        foreach ($file in $files) {
            Write-Host "Importing profile $($file.Name)..."
            netsh wlan add profile filename=$file.FullName user=all
        }
        
        Write-Host "SSID profiles imported successfully."
    } else {
        Write-Host "Operation cancelled."
    }
}

# Function to display the menu and handle user choices
function Show-Menu {
    while ($true) {
        Clear-Host
        Write-Host ""
        Write-Host "Please select what you would like to do:"
        Write-Host "1. Export current wireless SSID"
        Write-Host "2. Import wireless SSID"
        Write-Host "3. Exit"
        Write-Host ""
        $choice = Read-Host "Enter your choice (1, 2, or 3)"
        
        switch ($choice) {
            1 { Export-WifiProfiles }
            2 { Import-WifiProfiles }
            3 { Write-Host "Exiting..."; break }
            default { Write-Host "Invalid choice, please choose 1, 2, or 3." }
        }
        
        if ($choice -eq "3") { break }
        Read-Host "Press Enter to return to the menu"
    }
}

# Show menu
Show-Menu

# End script
Write-Host "Goodbye!"
