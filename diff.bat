@echo off
REM diff.bat - Imitates Linux's diff using the fc command.
REM Usage: diff file1 file2 [options]

if "%~2"=="" (
    echo Usage: diff file1 file2 [options]
    goto :EOF
)
fc %1 %2
