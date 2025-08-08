@echo off
REM top.bat - Mimic Linux top command with options

set interval=10

REM Parse options
:parse_arguments
if "%~1"=="-s" (
    shift
    set interval=%~1
)
shift
goto parse_arguments

:start_monitoring
echo Press Ctrl+C to exit.

:loop
cls
echo Displaying running processes:
tasklist /FO TABLE /NH
timeout %interval% >nul
goto loop
