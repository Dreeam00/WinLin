@echo off
setlocal EnableDelayedExpansion

:: Initialize
set "print_path=false"
set "target="

:: Argument parsing
:parse_arguments
if "%~1"=="" goto start_cd
if /i "%~1"=="-P" (
    set "print_path=true"
) else (
    set "target=%~1"
)
shift
goto parse_arguments

:start_cd
if "%target%"=="" (
    echo [[!ESC%[31mX%ESC%[0m]] bash: 'cd-lin' requires a path argument.
    exit /b 1
)

:: Try changing directory
cd /D "%target%" >nul 2>&1
if %errorlevel% neq 0 (
    echo [[!ESC%[31mX%ESC%[0m]] bash: cd: '%target%' への移動に失敗しました。
    exit /b 1
)

:: Format and display final path
if "%print_path%"=="true" (
    for /f "delims=" %%i in ('cd') do set "PWD=%%i"
    set "HOMEDIR=C:\Users\%USERNAME%"
    set "DISPLAYPWD=!PWD:%HOMEDIR%=~/!"
    set "DISPLAYPWD=!DISPLAYPWD:C:=~!"
    set "DISPLAYPWD=!DISPLAYPWD:\=/!"
    echo !DISPLAYPWD!
)
start bash-lin