@echo off
REM head.bat - Displays the first N lines of a file.
REM Usage: head -n <number_of_lines> <file>

if "%~3"=="" (
    echo Usage: head -n <number_of_lines> <file>
    goto :EOF
)

if /I "%~1"=="-n" (
    set "lines=%~2"
    set "file=%~3"
) else (
    echo Invalid option. Use -n to specify the number of lines.
    goto :EOF
)

echo Displaying the first %lines% lines of %file%:
powershell -Command "Get-Content '%file%' | Select-Object -First %lines%"
