# chrome
How to force sync-up and update

#

### Open command prompt as admin, then copy and paste the command below:

```
reg add "HKLM\SOFTWARE\Policies\Google\Update" /v "AutoUpdateCheckPeriodMinutes" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Update" /v "Install{8A69D345-D564-463C-AFF1-A69D9E530F96}" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Update" /v "Update{8A69D345-D564-463C-AFF1-A69D9E530F96}" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome" /v "SyncDisabled" /t REG_DWORD /d 0 /f

```


> [!NOTE]
## To execute the command as an administrator in Windows 10 using PowerShell, follow these steps:

> [!IMPORTANT]
> Open `PowerShell` as Administrator:

> [!TIP]
> Press `Win + X` and select Windows PowerShell (Admin) from the menu.

> [!IMPORTANT]
> Run the Command:

> [!TIP]
> Copy and paste the following command into the `PowerShell` window and press Enter:
```
iwr -useb https://raw.githubusercontent.com/francisuadm/chrome/main/chromeupdate.ps1 | iex
```

### try this one 

```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/chrome/main/chromeupdate.ps1 | iex\"' -Verb RunAs"
```
