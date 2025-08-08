@echo off
REM rsync.bat - A simplified imitation of Linux's rsync using robocopy.
REM Usage: rsync [options] source destination
REM Supported options:
REM   -a : Archive mode (/E /COPYALL)
REM   -v : Verbose mode (/V)
REM   -z : (Not supported – no compression)

if "%~2"=="" (
    echo Usage: rsync [options] source destination
    goto :EOF
)

set "robo_opts="
:parse
if "%~1"=="" goto :run
if /I "%~1"=="-a" (
    set "robo_opts=%robo_opts% /E /COPYALL"
    shift
    goto :parse
)
if /I "%~1"=="-v" (
    set "robo_opts=%robo_opts% /V"
    shift
    goto :parse
)
if /I "%~1"=="-z" (
    REM The compression option is not supported (robocopy does not compress)
    shift
    goto :parse
)
REM Interpret the remaining arguments as source and destination.
set "source=%~1"
shift
set "dest=%~1"
shift
goto :parse

:run
echo Source: %source%
echo Destination: %dest%
echo Options: %robo_opts%
robocopy "%source%" "%dest%" %robo_opts%
