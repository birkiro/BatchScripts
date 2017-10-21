@echo off

SET GITPATH=%1
echo %GITPATH%

cd %GITPATH%
git pull

pause
goto :eof