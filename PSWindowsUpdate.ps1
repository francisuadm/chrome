Absolutely, I can help with that! You can use PowerShell to manually update Windows 10 without going through the SCCM server. Here's a step-by-step guide:

1. **Open PowerShell as Administrator**:
   - Type `PowerShell` in the search bar.
   - Right-click on PowerShell and select "Run as Administrator".

2. **Set Execution Policy**:
   - Run the following command to set the execution policy:
     ```powershell
     Set-ExecutionPolicy RemoteSigned
     ```
   - Type `Y` and press Enter to confirm.

3. **Install PSWindowsUpdate Module**:
   - Run the following command to install the PSWindowsUpdate module:
     ```powershell
     Install-Module PSWindowsUpdate -Force
     ```
   - Confirm adding repositories by pressing `Y`.

4. **Import the Module**:
   - Run the following command to import the module:
     ```powershell
     Import-Module PSWindowsUpdate
     ```

5. **Check for Available Updates**:
   - Run the following command to check for available updates:
     ```powershell
     Get-WindowsUpdate
     ```

6. **Install Updates**:
   - To install all available updates, run:
     ```powershell
     Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
     ```

This process will allow your machine to pull updates directly from the Microsoft Update servers²³.

If you prefer using Command Prompt, you can use the following command to force a Windows Update check:
```cmd
wuauclt.exe /updatenow
```

Let me know if you need any further assistance! 😊

Source: Conversation with Copilot, 8/2/2024
(1) How To Manually Update Windows 10/11 Using PowerShell - The Geek Page. https://thegeekpage.com/how-to-manually-update-windows-10-11-using-powershell/.
(2) Install and Manage Windows Updates with PowerShell (PSWindowsUpdate .... https://woshub.com/pswindowsupdate-module/.
(3) Command line to force a Windows Update check - Windows - Spiceworks .... https://community.spiceworks.com/t/command-line-to-force-a-windows-update-check/818838.
(4) How to (Force) Run Windows Update From Command Line | 2 Ways. https://www.diskpart.com/tips-tricks/windows-update-command-line-1503.html.
(5) How to install Windows 10 update using PowerShell. https://pureinfotech.com/install-windows-10-update-powershell/.
