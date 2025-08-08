@echo off
if "%1"=="-g" (
    echo User Groups:
    whoami /groups
) else (
    whoami
)
