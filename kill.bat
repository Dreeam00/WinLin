@echo off
REM kill.bat - Mimic Linux kill command with options

set force=false
set process_name=

REM Parse options
:parse_arguments
if "%~1"=="" goto start_kill
if "%~1"=="-f" set force=true
if "%~1"=="-p" (
    shift
    set process_name=%~1
)
if not "%~1"=="-f" if not "%~1"=="-p" set pid=%~1
shift
goto parse_arguments

:start_kill
REM Process termination logic
if not "%process_name%"=="" (
    taskkill /IM "%process_name%" /F
    if %errorlevel% neq 0 (
        echo ERROR: Failed to terminate the process "%process_name%".
        exit /b 1
    ) else (
        echo Successfully terminated the process "%process_name%".
    )
) else if not "%pid%"=="" (
    if "%force%"=="true" (
        taskkill /PID %pid% /F
    ) else (
        taskkill /PID %pid%
    )
    if %errorlevel% neq 0 (
        echo ERROR: Failed to terminate the process with PID %pid%.
        exit /b 1
    ) else (
        echo Successfully terminated the process with PID %pid%.
    )
) else (
    echo ERROR: Please specify a PID or process name.
    exit /b 1
)
