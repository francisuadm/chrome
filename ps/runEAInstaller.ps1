# Download the batch file
iwr -Uri "https://raw.githubusercontent.com/francisuadm/chrome/main/ps/EnableAppInstaller.bat" -OutFile "C:\IT_Folder\EnableAppInstaller.bat"

# Run the batch file with elevated privileges using cmd.exe
Start-Process -FilePath "cmd.exe" -ArgumentList "/c start cmd /k \"C:\IT_Folder\EnableAppInstaller.bat\"" -Verb RunAs
