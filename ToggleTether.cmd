Rem This script toggles tether on Android device via Android Debug Bridge, make use USB debugging is on and platform-tools is installed on your computer before running.
@echo off
title [ImAyx.Pro] Toggling Tether...
echo This scripts needs to be edited before use. (replace Your-Device-Name with your Android device name or IP)
Rem You can also remove the "-s" parameter if you're sure there'll be no more than one device connected to your computer at a time.
echo.
echo Enabling Wi-Fi on device...
Rem These two operations are for compatibility of wireless debugging (so the setting can be toggled weather the phone is connected via USB cable or not), if you don't need to toggle tether wirelessly you can remove this part.
echo.
adb -s Your-Device-Name shell svc wifi enable
echo.
echo Connecting to device via Wi-Fi...
Rem If your device runs Android 11+, I suggest that you run this command when it's connected via USB:
Rem adb tcpip 5555
Rem This will make the wireless debugging port always the default 5555, not an always changing annoying random port.
echo.
adb connect Your-Device-Name
Rem If your router doesn't support using the hostname, set up a static local IP address for your device either in router panel or the device settings.
echo.
echo Opening up Tether Settings...
echo.
adb -s Your-Device-Name shell am start -n com.android.settings/.TetherSettings
echo.
echo Toggling Tether...
echo.
adb -s Your-Device-Name shell input keyevent 66
title [ImAyx.Pro] Toggle completed
echo.
echo Tether toggled. Press any key to exit.
pause > nul
