@echo off
REM scp.bat - Mimic Linux scp command with options

set port=22
set verbose=false

REM Parse options
:parse_arguments
if "%~1"=="-P" (
    shift
    set port=%~1
)
if "%~1"=="-v" set verbose=true
if not "%~1"=="-P" if not "%~1"=="-v" (
    if "%source%"=="" set source=%~1
    if "%destination%"=="" set destination=%~1
)
shift
goto parse_arguments

:start_transfer
REM Check if required tools are available
where pscp >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: pscp (PuTTY SCP) is not installed or not in PATH.
    exit /b 1
)

REM Perform file transfer
if "%verbose%"=="true" (
    pscp -P %port% -v "%source%" "%destination%"
) else (
    pscp -P %port% "%source%" "%destination%"
)

if %errorlevel% neq 0 (
    echo ERROR: Failed to transfer "%source%" to "%destination%".
) else (
    echo Successfully transferred "%source%" to "%destination%".
)
