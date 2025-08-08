@echo off
REM zip.bat - Mimics Linux's zip using PowerShell's Compress-Archive.
REM Usage: zip archive.zip file_or_folder [file_or_folder ...]

if "%~2"=="" (
    echo Usage: zip archive.zip file_or_folder [file_or_folder ...]
    goto :EOF
)
set "archive=%~1"
shift
set "files="
:loop
if "%~1"=="" goto :zip
set "files=%files% '%~1'"
shift
goto :loop

:zip
echo Creating archive: %archive% with the following files/folders: %files%
powershell -Command "Compress-Archive -Path %files% -DestinationPath '%archive%'"
