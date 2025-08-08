@echo off
if "%1"=="-s" (
    for /f "tokens=1,2 delims=," %%a in ('systeminfo ^| find "起動時間"') do echo Uptime: %%a %%b
) else (
    for /f "tokens=1-4 delims=, " %%a in ('systeminfo ^| find "起動時間"') do echo System Uptime: %%a %%b %%c %%d
)
