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



## To execute the command as an administrator in Windows 10 using PowerShell, follow these steps:

1. Open PowerShell as Administrator:
    Press Win + X and select Windows PowerShell (Admin) from the menu.

2. Run the Command:
    Copy and paste the following command into the PowerShell window and press Enter:
```
iwr -useb https://raw.githubusercontent.com/francisuadm/chrome/main/chromeupdate.ps1 | iex
```

### try this one 

```
powershell -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command \"iwr -useb https://raw.githubusercontent.com/francisuadm/chrome/main/chromeupdate.ps1 | iex\"' -Verb RunAs"
```





# Logitech G OBS Studio Plugin

This is a plugin for [OBS Studio](https://obsproject.com/) exposing actions to [G HUB](https://www.logitechg.com/en-us/innovation/g-hub.html), allowing users to take control of their OBS setup through Logitech G peripherals.

## File structure

* `obs_plugin` directory contains the source code for the plugin.
* `obs_plugin/libs` directory contains precompiled libraries of [OBS Studio](https://github.com/obsproject/obs-studio).
* `other` directory contains libraries and other dependencies for the plugin.
* `other/obs-studio` directory contains source code for an API-only version of [OBS Studio](https://github.com/obsproject/obs-studio).

## Libraries and Other Dependencies
* [Asio C++ Library](https://github.com/chriskohlhoff/asio)
* [JSON for Modern C++](https://github.com/nlohmann/json)
* [OBS Studio](https://github.com/obsproject/obs-studio)
* [WebSocket++](https://github.com/zaphoyd/websocketpp)
