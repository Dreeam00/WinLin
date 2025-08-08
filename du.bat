@echo off
REM du.bat - Simulates Linux's du command to show disk usage.
REM Usage: du [options] <directory>
REM Options:
REM   -h                : Human-readable format (e.g., KB, MB, GB).
REM   -s                : Show only the total size (summary).
REM   --max-depth=<N>   : Limit output to N levels of depth.

if "%~1"=="" (
    echo Usage: du [options] <directory>
    echo Options:
    echo   -h                : Human-readable format (e.g., KB, MB, GB).
    echo   -s                : Show only the total size (summary).
    echo   --max-depth=<N>   : Limit output to N levels of depth.
    goto :EOF
)

set "human_readable=0"
set "summary=0"
set "max_depth="
set "target="

:parse
if "%~1"=="" goto :run
if /I "%~1"=="-h" (
    set "human_readable=1"
    shift
    goto :parse
)
if /I "%~1"=="-s" (
    set "summary=1"
    shift
    goto :parse
)
if /I "%~1:~0,12%"=="--max-depth=" (
    set "max_depth=%~1:12%"
    shift
    goto :parse
)
set "target=%~1"
shift
goto :parse

:run
if "%target%"=="" set "target=."

if "%summary%"=="1" (
    if "%human_readable%"=="1" (
        powershell -Command "(Get-ChildItem -Recurse '%target%' | Measure-Object -Property Length -Sum).Sum / 1MB | ForEach-Object { '{0:N2} MB' -f $_ }"
    ) else (
        powershell -Command "(Get-ChildItem -Recurse '%target%' | Measure-Object -Property Length -Sum).Sum"
    )
    goto :EOF
)

if "%human_readable%"=="1" (
    powershell -Command "Get-ChildItem '%target%' -Recurse -Depth %max_depth% | ForEach-Object { '{0:N2} MB - {1}' -f ($_.Length / 1MB), $_.FullName }"
) else (
    powershell -Command "Get-ChildItem '%target%' -Recurse -Depth %max_depth% | ForEach-Object { '$($_.Length) bytes - $($_.FullName)' }"
)
