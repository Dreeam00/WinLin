@echo off
set count=5
if "%~1"=="-c" if not "%~2"=="" set count=%~2
echo Showing the last %count% login events...
echo ---------------------------------
wevtutil qe Security /q:"*[System[(EventID=4624)]]" /f:text /c:%count%
echo ---------------------------------
echo Use "-c [number]" to specify the number of events to display.