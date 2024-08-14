cd c:\IT_Folder\
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile C:\IT_Folder\Desktop.appx
Invoke-WebRequest -Uri https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.8.6 -OutFile C:\IT_Folder\UI.Xaml.2.8.6.nupkg.zip
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.8.1911/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile C:\IT_Folder\DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Add-AppxPackage -Path .\Desktop.appx
Expand-Archive -Path .\UI.Xaml.2.8.6.nupkg.zip -DestinationPath C:\IT_Folder\UI.Xaml.2.8.6
Add-AppxPackage -Path C:\IT_Folder\UI.Xaml.2.8.6\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.8.appx
Add-AppxPackage -Path C:\IT_Folder\DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
winget
