# Function to generate a unique folder path based on current date and time
function Get-UniqueFolderPath {
    $timestamp = (Get-Date).ToString("yyyyMMdd_HHmmss")
    $folderPath = "C:\IT_Folder\Wireless_$timestamp"
    return $folderPath
}

# Function to export all wireless profiles
function Export-WifiProfiles {
    $folderPath = Get-UniqueFolderPath
    # Create the export directory
    New-Item -Path $folderPath -ItemType Directory -Force
    Write-Host "Exporting all wireless profiles to $folderPath..."
    netsh wlan export profile folder=$folderPath key=clear
    Write-Host "All profiles have been exported successfully to $folderPath."
}

# Function to import wireless profiles
function Import-WifiProfiles {
    # Prompt for the folder path to import from
    $folderPath = Read-Host "Enter the folder path containing the wireless profiles to import"

    if (-not (Test-Path -Path $folderPath)) {
        Write-Host "The specified folder does not exist."
        return
    }
    
    Write-Host "We are going to import all the profiles from this folder!"
    $answer = Read-Host "Do you want to continue (Y/N)?"
    
    if ($answer -match '^[yY](es)?$') {
        Write-Host "Importing all profiles from $folderPath..."
        $files = Get-ChildItem -Path $folderPath -Filter "*.xml"
        
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
