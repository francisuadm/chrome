### To install the Poly Lens Desktop app for all users on a Windows 10 computer, you can use PowerShell to run the MSI installer with administrative privileges. Here's how you can do it:


1. **Download the MSI file**:
   First, download the MSI file from the provided link:
   ```powershell
   Invoke-WebRequest -Uri "https://swupdate.lens.poly.com/lens-desktop-windows/1.4.0/1.4.0/PolyLens-1.4.0.msi" -OutFile "C:\Path\To\Save\PolyLens-1.4.0.msi"
   ```

2. **Install the MSI file for all users**:
   Use the `msiexec` command to install the MSI file for all users. Run the following PowerShell command with administrative privileges:
   ```powershell
   Start-Process msiexec.exe -ArgumentList "/i C:\Path\To\Save\PolyLens-1.4.0.msi /quiet /norestart ALLUSERS=1" -Wait -NoNewWindow
   ```

Replace `C:\Path\To\Save\PolyLens-1.4.0.msi` with the actual path where you saved the MSI file.

This will install the Poly Lens Desktop app for all users on the computer. If you encounter any issues or need further assistance, feel free to ask!
