@echo off
REM sudo.bat - Mimic Linux sudo command with elevated privileges

REM Check if the script is already running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Administrator privileges are required. Restarting with elevated privileges...
    powershell -Command "Start-Process -FilePath '%~0' -ArgumentList '%*' -Verb RunAs"
    exit /b
)

REM Execute the given command
if "%~1"=="" (
    echo ERROR: Please specify the command to run as administrator.
    exit /b 1
)

set command=%*
echo Executing command as administrator: %command%
%command%

REM Wait for user input to keep the window open
echo.
echo Press any key to exit...
pause >nul
