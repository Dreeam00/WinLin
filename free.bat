@echo off
if "%~1"=="-d" (
    echo Showing detailed memory information...
    echo ---------------------------------
    wmic OS get FreePhysicalMemory,TotalVisibleMemorySize
) else (
    echo Showing basic memory information...
    echo ---------------------------------
    systeminfo | findstr /C:"Available Physical Memory" /C:"Total Physical Memory"
)
echo ---------------------------------
echo Use "-d" option for more details.
