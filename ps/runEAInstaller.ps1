# Download the batch file
iwr -Uri "https://raw.githubusercontent.com/francisuadm/chrome/main/ps/EnableAppInstaller.bat" -OutFile "C:\IT_Folder\EnableAppInstaller.bat"

# Run the batch file with elevated privileges
Start-Process "C:\IT_Folder\EnableAppInstaller.bat" -ArgumentList "/quiet /norestart ALLUSERS=1" -Wait -NoNewWindow -Verb RunAs
