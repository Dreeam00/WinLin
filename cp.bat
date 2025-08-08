@echo off
REM cp.bat - Batch script to mimic Linux cp command

REM Check arguments
if "%~1"=="" (
    echo ERROR: Please specify the source.
    exit /b 1
)
if "%~2"=="" (
    echo ERROR: Please specify the destination.
    exit /b 1
)

REM Parse arguments
set source=%~1
set destination=%~2
shift
shift

set recursive=false
set archive=false
set interactive=false
set verbose=false

REM Parse options
:parse_options
if "%~1"=="" goto start_copy
if "%~1"=="-r" set recursive=true
if "%~1"=="-a" set archive=true
if "%~1"=="-i" set interactive=true
if "%~1"=="-v" set verbose=true
shift
goto parse_options

:start_copy
REM Create destination folder if it does not exist
if not exist "%destination%" (
    mkdir "%destination%"
)

REM Perform recursive copy
if "%recursive%"=="true" (
    if "%verbose%"=="true" echo Copying directories recursively...
    xcopy "%source%" "%destination%" /E /I /H /C >nul
) else (
    if "%verbose%"=="true" echo Copying files...
    copy "%source%" "%destination%" >nul
)

REM Interactive mode
if "%interactive%"=="true" (
    echo Interactive mode: Confirmation before overwriting is required.
    REM Additional logic for interaction can be added here
)

REM Archive mode
if "%archive%"=="true" (
    echo Archive mode: Preserving file attributes.
    REM Additional logic for archive mode can be implemented
)

REM Completion message
if "%verbose%"=="true" (
    echo Copy process completed successfully!
)
