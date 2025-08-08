@echo off
REM unzip.bat - Mimics Linux's unzip using PowerShell's Expand-Archive.
REM Usage: unzip archive.zip destination_folder

if "%~2"=="" (
    echo Usage: unzip archive.zip destination_folder
    goto :EOF
)
set "archive=%~1"
set "dest=%~2"
echo Extracting: %archive% -> %dest%
powershell -Command "Expand-Archive -Path '%archive%' -DestinationPath '%dest%' -Force"
