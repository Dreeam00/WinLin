@echo off
if "%1"=="" (
    echo Usage: cat file1 [file2 ...]
    exit /b 1
)
:loop
if "%1"=="" goto end
if exist %1 (
    type %1
) else (
    echo File not found: %1
)
shift
goto loop
:end
