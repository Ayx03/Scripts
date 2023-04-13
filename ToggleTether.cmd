@echo off
Rem This script toggles tether on Android device via Android Debug Bridge, make sure USB debugging is on and platform-tools is installed on your computer before running.
Rem This script needs to be edited before use. (replace Your-Device-Name with your Android device name or IP)
title [ImAyx.Pro] Toggling Tether...
echo This script needs to be edited before use. (replace Your-Device-Name with your Android device name or IP)
Rem It recommended that you remove the line above after you done the edit.
Rem You can also remove the "-s" parameter if you're sure there'll be no more than one device connected to your computer at a time.
echo.
echo Enabling Wi-Fi on the device...
Rem These two operations are for compatibility of wireless debugging (so the setting can be toggled weather the phone is connected via USB cable or not), if you don't need to toggle tether wirelessly you can remove this part.
echo.
adb -s Your-Device-Name shell svc wifi enable
if %errorlevel% neq 0 (
    title [ImAyx.Pro] Awaiting Response...
    color 6
    echo.
    echo Failed to enable Wi-Fi on the device. 
    echo.
    echo This operation is for compatibility of wireless debugging so the tether setting can be toggled weather the phone is connected via USB cable or not, if you don't need to toggle tether wirelessly you can edit the script remove this part.
    echo.
    echo Press any key to continue executing.
    pause > nul
    color 07
    Rem Reset color
)
echo.
echo Connecting to device via Wi-Fi...
Rem If your device runs Android 11+, I suggest that you run this command when it's connected via USB:
Rem adb tcpip 5555
Rem This will make the wireless debugging port always the default 5555, not an always changing annoying random port.
echo.
adb connect Your-Device-Name
if %errorlevel% neq 0 (
    echo.
    pause > nul
    exit /b 1
)
Rem If your router doesn't support using the hostname, set up a static local IP address for your device either in router panel or the device settings.
echo.
echo Opening up Tether Settings...
echo.
adb -s Your-Device-Name shell am start -n com.android.settings/.TetherSettings
if %errorlevel% neq 0 (
    title [ImAyx.Pro] Toggle Failed!
    color cf
    echo.
    echo Failed to open Tether Settings.
    echo.
    echo Please make sure USB debugging is on and platform-tools is installed on your computer before running.
    echo.
    echo It also might be because adb failed to connect to the device. Check the error message from adb above.
    echo.
    echo For platform tools, go to https://developer.android.com/studio/releases/platform-tools
    echo.
    echo ^(Hold Ctrl and click to open it directly in your browser^)
    echo.
    echo Press any key to exit.
    pause > nul
    color 07
    Rem reset color
    exit /b 2
)
echo.
echo Toggling Tether...
echo.
adb -s Your-Device-Name shell input keyevent 66
if %errorlevel% neq 0 (
    title [ImAyx.Pro] Toggle Failed!
    color cf
    echo.
    echo Failed to Toggle Tether.
    echo.
    echo Please make sure USB debugging is on and platform-tools is installed on your computer before running.
    echo.
    echo It also might be because adb failed to connect to the device. Check the error message from adb above.
    echo.
    echo For platform tools, go to https://developer.android.com/studio/releases/platform-tools
    echo.
    echo ^(Hold Ctrl and click on the link to open it directly in your browser^)
    echo.
    echo Press any key to exit.
    pause > nul
    color 07
    Rem reset color
    exit /b 3
)
