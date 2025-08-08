@echo off
REM mkdir.bat - Mimic Linux mkdir command with options

REM Initialize options
set parents=false

REM Parse options and arguments
:parse_arguments
if "%~1"=="" goto start_creation
if "%~1"=="-p" set parents=true
if not "%~1"=="-p" set target=%~1
shift
goto parse_arguments

:start_creation
REM Check if target directory is specified
if "%target%"=="" (
    echo ERROR: Please specify the directory to create.
    exit /b 1
)

REM Create parent directories if needed
if "%parents%"=="true" (
    mkdir "%target%"
    if %errorlevel% neq 0 (
        echo ERROR: Failed to create directory "%target%".
        exit /b 1
    ) else (
        echo Successfully created directory "%target%" with parent directories.
    )
) else (
    REM Create single directory
    if exist "%target%" (
        echo ERROR: The directory "%target%" already exists.
        exit /b 1
    )
    mkdir "%target%"
    if %errorlevel% neq 0 (
        echo ERROR: Failed to create directory "%target%".
        exit /b 1
    ) else (
        echo Successfully created directory "%target%".
    )
)
