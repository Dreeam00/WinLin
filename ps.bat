@echo off
REM ps.bat - Mimic Linux ps command with options

set show_memory=false

REM Parse options
if "%~1"=="-m" set show_memory=true

REM Display processes
if "%show_memory%"=="true" (
    tasklist /FO TABLE /NH /FI "MEMUSAGE gt 0"
) else (
    tasklist
)
