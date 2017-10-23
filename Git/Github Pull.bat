@echo off

if "%1." == "." goto not_specifed

set PROJECT=%~1
set PROJECTDIR=C:\Github

if %PROJECT%==ALL goto pull_all
call :pull %PROJECT%
goto finished

:pull_all
echo Pulling all projects
call :pull Patterns
call :pull BatchScripts
echo Finished pulling all projects from the Github repository
goto finished

:pull
cd %PROJECTDIR%\%PROJECT%
if %errorLevel% == 0 (
	echo Git Pulling %PROJECT%
	git pull
) else (
	echo Project path to '%PROJECT%' does not exist.
)
goto :eof

:not_specified
echo Command line parameter missing.
echo available parameters: [ALL], [Patterns], [BatchScripts].

:finished
pause
