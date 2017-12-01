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
echo Setting Unblock-US DNS
netsh interface ipv4 add dnsserver "Wi-Fi" address=64.145.73.5 index=1
netsh interface ipv4 add dnsserver "Wi-Fi" address=	209.107.219.5 index=2
IF %ERRORLEVEL% NEQ 0 GOTO :error
echo DNS Servers are now set to Unblock-US
start chrome https://www.unblock-us.com
rem goto :pause
goto :eof

:wronginput
echo Input is neither auto nor manual
goto :pause

:error
echo Error: Setting DNS Servers to %switch% was probably already done! 
goto :pause

:pause
pause
goto :eof