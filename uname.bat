@echo off
REM uname.bat - A simple imitation of the Linux uname command.
REM Usage: uname [-a]

if "%~1"=="-a" (
    echo --- System Information ---
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"
) else (
    ver
)
