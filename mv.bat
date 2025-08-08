@echo off
REM mv.bat - Enhanced to handle options like -i and -v

set interactive=false
set verbose=false

REM Parse arguments
:parse_arguments
if "%~1"=="" goto start_move
if "%~1"=="-i" set interactive=true
if "%~1"=="-v" set verbose=true
if not "%~1"=="-i" if not "%~1"=="-v" (
    if "%source%"=="" (
        set source=%~1
    ) else (
        set destination=%~1
    )
)
shift
goto parse_arguments

:start_move
REM Check arguments
if "%source%"=="" (
    echo ERROR: Please specify the source.
    exit /b 1
)
if "%destination%"=="" (
    echo ERROR: Please specify the destination.
    exit /b 1
)

REM Confirm overwrite in interactive mode
if "%interactive%"=="true" if exist "%destination%" (
    echo The file "%destination%" already exists. Overwrite? (Y/N)
    set /p choice=
    if /i not "%choice%"=="Y" (
        echo Move operation canceled.
        exit /b 1
    )
)

REM Perform the move
move "%source%" "%destination%"
if %errorlevel% neq 0 (
    echo ERROR: Failed to move or rename "%source%".
    exit /b 1
)

REM Verbose mode
if "%verbose%"=="true" (
    echo Successfully moved "%source%" to "%destination%".
)
