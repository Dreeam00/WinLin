@echo off
REM ifconfig.bat - Imitates Linux's ifconfig by calling ipconfig.
if "%~1"=="" (
    ipconfig /all
) else (
    ipconfig %*
)
