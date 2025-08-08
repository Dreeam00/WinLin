@echo off
if "%1"=="-l" (
    set
) else (
    set %1=%2
    echo Set %1=%2
)
