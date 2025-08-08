@echo off
REM find.bat - Mimic Linux find command with options

set name_pattern=false

REM Parse options and arguments
:parse_arguments
if "%~1"=="" goto start_find
if "%~1"=="-name" set name_pattern=true & shift & set name=%~1
if "%~1"=="" goto start_find
set directory=%~1
shift
goto parse_arguments

:start_find
REM Check arguments
if "%directory%"=="" (
    echo ERROR: Please specify the directory to search.
    exit /b 1
)
if "%name_pattern%"=="true" (
    dir "%directory%\%name%" /S
) else (
    dir "%directory%" /S
)
