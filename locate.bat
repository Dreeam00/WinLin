@echo off
if "%1"=="-e" (
    dir /s /b "%2"
) else if "%1"=="-c" (
    for /f %%a in ('dir /s /b "%2" ^| find /c /v ""') do echo Files found: %%a
) else (
    dir /s /b "%1"
)
