@echo off
if "%~1"=="-u" if not "%~2"=="" (
    echo Fetching details for user "%~2"...
    net user "%~2"
) else (
    echo Listing all local users...
    net user
    echo ---------------------------------
    echo Use "-u [username]" to get details for a specific user.
)
