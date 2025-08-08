@echo off
REM sed.bat - Simulates Linux sed using PowerShell.
REM Usage: sed "s/<search>/<replace>/[g]" file
REM   "s/.../.../g" : Global replacement.

if "%~2"=="" (
    echo Usage: sed "s/<search>/<replace>/[g]" file
    goto :EOF
)

REM Parse the sed command.
set "script=%~1"
set "file=%~2"

if not "%script:~0,2%"=="s/" (
    echo Error: Only "s/<search>/<replace>/[g]" format is supported.
    goto :EOF
)

REM Extract search and replace strings.
for /f "tokens=1,2 delims=/" %%a in ("%script:~2,-2%") do (
    set "search=%%a"
    set "replace=%%b"
)

REM Check if global mode (g option) is specified.
set "global=%script:~-1%"
if "%global%"=="g" (
    set "replace_mode=-replace"
) else (
    set "replace_mode=-replace '%search%', '%replace%' -InputObject"
)

echo Processing: %file% (%search% -> %replace%)
powershell -Command "(Get-Content '%file%') | ForEach-Object { $_ %replace_mode% '%search%', '%replace%' } | Set-Content '%file%.out'"
echo Replacement result saved to %file%.out.
