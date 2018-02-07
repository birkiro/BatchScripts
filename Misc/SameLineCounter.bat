@echo off
setlocal EnableDelayedExpansion

rem UP COUNTER
set COUNT=0
for /f %%a in ('copy /Z "%~f0" nul') do set "CR=%%a"
:loop
<nul set /P "=Counting up: %COUNT%     !CR!"
PING 1.1.1.1 -n 1 -w 100 >NUL
set /A COUNT=COUNT+1
goto :loop

rem DOWN COUNTER
rem for /f %%a in ('copy /Z "%~f0" nul') do set "CR=%%a"
rem 
rem for /L %%n in (100 -1 1) do (
rem     <nul set /P "=Counting down: %%n     !CR!"
rem     PING 1.1.1.1 -n 1 -w 100 >NUL
rem )