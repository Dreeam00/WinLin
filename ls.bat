@echo off
REM ls.bat - Enhanced to handle options like -l, -a, and -R

set target=.
set show_hidden=false
set recursive=false
set long_listing=false

REM Parse arguments
:parse_arguments
if "%~1"=="" goto start_listing
if "%~1"=="-a" set show_hidden=true
if "%~1"=="-R" set recursive=true
if "%~1"=="-l" set long_listing=true
if not "%~1"=="-a" if not "%~1"=="-R" if not "%~1"=="-l" set target=%~1
shift
goto parse_arguments

:start_listing
REM Base dir command options
set options=/B
if "%show_hidden%"=="true" set options=/A /B
if "%long_listing%"=="true" set options=
if "%recursive%"=="true" (
    dir "%target%" %options% /S
) else (
    dir "%target%" %options%
)
