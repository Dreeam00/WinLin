@echo off
if "%1"=="-l" (
    type %userprofile%\aliases.txt 2>nul || echo No aliases found.
) else if "%1"=="-d" (
    findstr /v /i "%2" %userprofile%\aliases.txt > temp.txt
    move /y temp.txt %userprofile%\aliases.txt
    echo Alias deleted: %2
) else (
    echo %1=%2>>%userprofile%\aliases.txt
    echo Alias added: %1=%2
)
