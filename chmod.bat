@echo off
REM chmod.bat - Simulates chmod using icacls.
REM Usage: chmod <permissions> <file>

if "%~2"=="" (
    echo Usage: chmod <permissions> <file>
    echo Example: chmod 755 file.txt
    goto :EOF
)

set "permissions=%~1"
set "file=%~2"

REM Note: Windows permissions do not map directly to Linux chmod.
echo Changing permissions for: %file%
icacls "%file%" /grant:r Everyone:(%permissions%)
