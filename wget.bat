@echo off
REM wget.bat - A simple approximation of Linux's wget using curl.
REM Usage: wget [options] URL
REM Option:
REM   -O <filename> : Specify output file name.

if "%~1"=="" (
    echo Usage: wget [options] URL
    goto :EOF
)

set "outfile="
:parse
if "%~1"=="" goto :download
if /I "%~1"=="-O" (
    shift
    if "%~1"=="" (
        echo Error: -O option requires a filename.
        goto :EOF
    )
    set "outfile=%~1"
    shift
    goto :parse
)
set "url=%~1"
shift
goto :parse

:download
if defined outfile (
    echo Downloading: %url% -> %outfile%
    curl -o "%outfile%" "%url%"
) else (
    echo Downloading: %url% (using default filename)
    curl -O "%url%"
)
