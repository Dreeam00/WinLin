@echo off
:: Winget batch file to mimic apt commands

if "%1" == "install" (
    shift
    winget install %*
) else if "%1" == "remove" (
    shift
    winget uninstall %*
) else if "%1" == "purge" (
    shift
    winget uninstall %*
) else if "%1" == "autoremove" (
    echo There is no corresponding option in winget. Please manually remove unnecessary packages.
) else if "%1" == "update" (
    echo Winget repositories are automatically updated.
) else if "%1" == "upgrade" (
    if "%2" == "--all" (
        winget upgrade --all
    ) else (
        shift
        winget upgrade %*
    )
) else if "%1" == "full-upgrade" (
    echo There is no corresponding option in winget. Please manually remove unnecessary packages.
) else if "%1" == "show" (
    shift
    winget show %*
) else if "%1" == "list" (
    if "%2" == "--installed" (
        winget list
    ) else if "%2" == "--upgradable" (
        winget list --upgradable
    ) else (
        winget search %2
    )
) else if "%1" == "search" (
    shift
    winget search %*
) else (
    echo Unknown command. Available commands are install, remove, purge, autoremove, update, upgrade, full-upgrade, show, list, search.
)
