# Set the paths
$exportPath = "C:\IT_folder\favorites"
$importPath = "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default"

# Create the export directory if it doesn't exist
if (-not (Test-Path -Path $exportPath)) {
    New-Item -Path $exportPath -ItemType Directory
}

# Function to export Chrome bookmarks
function Export-Bookmarks {
    Write-Host "Exporting Chrome bookmarks..."
    Copy-Item -Path "$importPath\Bookmarks" -Destination "$exportPath\Bookmarks.bak" -Force
    Write-Host "Bookmarks exported to $exportPath\Bookmarks.bak"
}

# Function to import Chrome bookmarks
function Import-Bookmarks {
    Write-Host "Importing Chrome bookmarks..."
    Copy-Item -Path "$exportPath\Bookmarks.bak" -Destination "$importPath\Bookmarks" -Force
    Write-Host "Bookmarks imported successfully."
}

# Menu for importing bookmarks
function Show-Menu {
    Write-Host ""
    Write-Host "1. Import Chrome bookmarks"
    Write-Host "2. Exit"
    $choice = Read-Host "Enter your choice (1 or 2)"

    switch ($choice) {
        1 { Import-Bookmarks }
        2 { Exit }
        default { Write-Host "Invalid choice. Please enter 1 or 2." ; Show-Menu }
    }
}

# Export Chrome bookmarks
Export-Bookmarks

# Show menu
Show-Menu

# End script
Write-Host "Exiting..."
