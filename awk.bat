@echo off
REM awk.bat - Simulates Linux awk using PowerShell.
REM Usage: awk "<script>" <file>
REM   {print $1, $2} : Outputs specified columns.

if "%~2"=="" (
    echo Usage: awk "<script>" file
    goto :EOF
)

set "script=%~1"
set "file=%~2"

REM Parse script: Only supports {print $1, $2} format.
set "command="
if "%script:~0,7%"=="{print " (
    set "command=Write-Host"
    set "fields=%script:~7,-1%"
    for %%i in (%fields%) do (
        set "command=%command% $('$_.Split()')[%%i-1] + ' ' +"
    )
    set "command=%command:~0,-9%"
) else (
    echo Error: Currently, only "{print $1, $2}" is supported.
    goto :EOF
)

echo Processing: %file%
powershell -Command "(Get-Content '%file%') | ForEach-Object { %command% }"
