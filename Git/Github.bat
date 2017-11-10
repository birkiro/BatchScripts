@echo off

if "%1." == "." goto not_specifed_gitmethod
if "%2." == "." goto not_specifed

set PROJECTDIR=C:\Github
set GITMETHOD=%1
set PROJECT=%~2

echo Git Method:  %GITMETHOD%
echo Git Project: %PROJECT%
echo .

if %GITMETHOD%==pull goto :pull
if %GITMETHOD%==sync goto :sync
if %GITMETHOD%==push goto :push

:pull
if %PROJECT%==all goto pull_all
call :pull_project %PROJECT%
goto :finished

:pull_all
echo Pulling all projects
call :pull_project Patterns
call :pull_project BatchScripts
call :pull_project CodeVault
echo Finished pulling all projects from the Github repository
goto :finished

:pull_project
cd %PROJECTDIR%\%1
if %errorLevel% == 0 (
	echo Git Pulling %1
	git pull
) else (
	echo Project path to '%1' does not exist.
)
goto :eof

:sync
if %PROJECT%==all goto sync_all
call :sync_project %PROJECT%
goto :finished

:sync_project
cd %PROJECTDIR%\%1
if %errorLevel% == 0 (
	echo Git Syncing %1
	git pull
	git push
) else (
	echo Project path to '%1' does not exist.
)
goto :eof

:push
git push
goto :finished

:not_specified
echo Command line parameter missing.
echo available parameters: [all], [Patterns], [BatchScripts], [CodeVault].
goto :finished

:not_specifed_gitmethod
echo Command line parameter "1" missing.
echo available parameters: [pull], [push], [sync].
goto :finished

:finished
pause
