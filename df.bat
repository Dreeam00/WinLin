@echo off
REM df.bat - Mimic Linux df command with options

set human_readable=false

REM Parse options
if "%~1"=="-h" set human_readable=true

REM Display disk usage
if "%human_readable%"=="true" (
    wmic logicaldisk get name,size,freespace /format:csv | more
) else (
    wmic logicaldisk get name,size,freespace
)
