@echo off
REM grep.bat - Mimic Linux grep command with options

set ignore_case=false

REM Parse options and arguments
:parse_arguments
if "%~1"=="" goto start_search
if "%~1"=="-i" set ignore_case=true
if not "%~1"=="-i" (
    if "%pattern%"=="" set pattern=%~1
    if "%file%"=="" set file=%~1
)
shift
goto parse_arguments

:start_search
REM Check arguments
if "%pattern%"=="" (
    echo ERROR: Please specify the search pattern.
    exit /b 1
)
if "%file%"=="" (
    echo ERROR: Please specify the file to search.
    exit /b 1
)

REM Perform the search
if "%ignore_case%"=="true" (
    findstr /I "%pattern%" "%file%"
) else (
    findstr "%pattern%" "%file%"
)

if %errorlevel% neq 0 (
    echo No matches found for "%pattern%" in "%file%".
)
