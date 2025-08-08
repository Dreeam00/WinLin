@echo off
REM rm.bat - Mimic Linux rm command with options

REM Initialize options
set recursive=false
set interactive=false
set verbose=false

REM Parse options and arguments
:parse_arguments
if "%~1"=="" goto start_removal
if "%~1"=="-r" set recursive=true
if "%~1"=="-i" set interactive=true
if "%~1"=="-v" set verbose=true
if not "%~1"=="-r" if not "%~1"=="-i" if not "%~1"=="-v" set target=%~1
shift
goto parse_arguments

:start_removal
REM Check if target is specified
if "%target%"=="" (
    echo ERROR: Please specify a file or directory to remove.
    exit /b 1
)

REM Check if target exists
if not exist "%target%" (
    echo ERROR: The target "%target%" does not exist.
    exit /b 1
)

REM Interactive mode
if "%interactive%"=="true" (
    echo Are you sure you want to remove "%target%"? (Y/N)
    set /p choice=
    if /i not "%choice%"=="Y" (
        echo Removal canceled.
        exit /b 1
    )
)

REM Remove files or directories
if "%recursive%"=="true" (
    if "%verbose%"=="true" echo Removing directory "%target%" recursively...
    rmdir /S /Q "%target%"
) else (
    if "%verbose%"=="true" echo Removing file "%target%"...
    del /Q "%target%"
)

REM Check for errors
if %errorlevel% neq 0 (
    echo ERROR: Failed to remove "%target%".
    exit /b 1
) else (
    echo Successfully removed "%target%".
)
