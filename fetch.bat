@echo off
setlocal EnableDelayedExpansion

:: ANSIカラー
for /f %%a in ('"prompt $E & for %%b in (1) do rem"') do set "ESC=%%a"
set "FG_CYAN=%ESC%[36m"
set "FG_YELLOW=%ESC%[33m"
set "FG_WHITE=%ESC%[97m"
set "RESET=%ESC%[0m"

:: システム情報
set "USER=%USERNAME%"
set "HOST=%COMPUTERNAME%"
for /f "tokens=*" %%i in ('ver') do set "OS=%%i"
set "SHELL=cmd.exe"

:: PowerShellで CPU/メモリ取得（WMIC非依存）
for /f "usebackq delims=" %%i in (`powershell -nologo -command "Get-CimInstance Win32_Processor | Select-Object -ExpandProperty Name"`) do set "CPU=%%i"
for /f %%i in ('powershell -nologo -command "(Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1MB"') do set "MEM=%%i"

:: 出力開始
echo.
echo !FG_CYAN!
echo  __        ___       _     _
echo  \ \      / (_)_ __ ^| ^|   (_)_ __
echo   \ \ /\ / / ^| ^| '_ \^| ^|   ^| ^| '_ \
echo    \ V  V /  ^| ^| ^| ^| ^|___^| ^| ^| ^| ^| ^|
echo     \_/\_/   ^|_^|_^| ^|_^|_____^|_^|_^| ^|_^|
echo.

echo !FG_YELLOW!User:     !FG_WHITE!!USER!
echo !FG_YELLOW!Host:     !FG_WHITE!!HOST!
echo !FG_YELLOW!OS:       !FG_WHITE!!OS!
echo !FG_YELLOW!Shell:    !FG_WHITE!!SHELL!
echo !FG_YELLOW!CPU:      !FG_WHITE!!CPU!
echo !FG_YELLOW!Memory:   !FG_WHITE!!MEM! MB
echo.

endlocal