@echo off

SET switch=%1

IF "%switch%"=="auto" goto :auto
IF "%switch%"=="manual" goto :manual
goto :wronginput

:auto
netsh interface ip set dnsservers name="Wi-Fi" source=dhcp
IF %ERRORLEVEL% NEQ 0 GOTO :error
echo DNS Servers are now automatically retrieved from DHCP
goto :pause

:manual
echo setting Unblock-US DNS
netsh interface ipv4 add dnsserver "Wi-Fi" address=208.122.23.23 index=1
netsh interface ipv4 add dnsserver "Wi-Fi" address=208.122.23.22 index=2
IF %ERRORLEVEL% NEQ 0 GOTO :error
echo DNS Servers are now set to Unblock-US
goto :pause

:wronginput
echo Input is neither auto nor manual

:error
echo Error: Setting DNS Servers to %switch% was probably already done! 

:pause
pause
goto :eof