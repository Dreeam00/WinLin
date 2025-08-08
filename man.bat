@echo off
REM man.bat - A simple imitation of the Linux man command.
REM Usage: man command

if "%~1"=="" (
    echo Usage: man command
    goto :EOF
)

if /I "%~1"=="alias" (
    echo --- alias Manual ---
    echo alias: Creates a command shortcut.
    echo Usage: alias name="command"
    goto :EOF
)

if /I "%~1"=="apt" (
    echo --- apt Manual ---
    echo apt: A package management tool for installing, updating, or removing packages.
    echo Usage: apt [options] {install^|update^|remove} package
    goto :EOF
)

if /I "%~1"=="awk" (
    echo --- awk Manual ---
    echo awk: A powerful text processing language.
    echo Usage: awk "pattern {action}" file
    goto :EOF
)

if /I "%~1"=="bash-lin" (
    echo --- bash-lin Manual ---
    echo bash-lin: Launches a Linux bash-like shell environment.
    echo Usage: bash-lin [options]
    goto :EOF
)

if /I "%~1"=="cat" (
    echo --- cat Manual ---
    echo cat: Displays the contents of a file.
    echo Usage: cat filename
    goto :EOF
)

if /I "%~1"=="cd-lin" (
    echo --- cd-lin Manual ---
    echo cd-lin: Changes the current directory.
    echo Usage: cd-lin directory
    goto :EOF
)

if /I "%~1"=="chmod" (
    echo --- chmod Manual ---
    echo chmod: Changes file permissions.
    echo Usage: chmod mode filename
    goto :EOF
)

if /I "%~1"=="clear" (
    echo --- clear Manual ---
    echo clear: Clears the terminal screen.
    echo Usage: clear
    goto :EOF
)

if /I "%~1"=="cp" (
    echo --- cp Manual ---
    echo cp: Copies files or directories.
    echo Usage: cp source destination
    goto :EOF
)

if /I "%~1"=="curl-lin" (
    echo --- curl-lin Manual ---
    echo curl-lin: Transfers data to or from a server.
    echo Usage: curl-lin [options] URL
    goto :EOF
)

if /I "%~1"=="df" (
    echo --- df Manual ---
    echo df: Reports file system disk space usage.
    echo Usage: df [options]
    goto :EOF
)

if /I "%~1"=="diff" (
    echo --- diff Manual ---
    echo diff: Compares two files line by line.
    echo Usage: diff file1 file2
    goto :EOF
)

if /I "%~1"=="du" (
    echo --- du Manual ---
    echo du: Estimates file or directory space usage.
    echo Usage: du [options] [directory]
    goto :EOF
)

if /I "%~1"=="env" (
    echo --- env Manual ---
    echo env: Displays or modifies the environment variables.
    echo Usage: env [options] [command]
    goto :EOF
)

if /I "%~1"=="find" (
    echo --- find Manual ---
    echo find: Searches for files in a directory hierarchy.
    echo Usage: find [path] [expression]
    goto :EOF
)

if /I "%~1"=="finger-lin" (
    echo --- finger-lin Manual ---
    echo finger-lin: Provides user information lookup.
    echo Usage: finger-lin [username]
    goto :EOF
)

if /I "%~1"=="free" (
    echo --- free Manual ---
    echo free: Displays memory usage statistics.
    echo Usage: free [options]
    goto :EOF
)

if /I "%~1"=="grep" (
    echo --- grep Manual ---
    echo grep: Searches for patterns within files.
    echo Usage: grep [options] "pattern" file
    goto :EOF
)

if /I "%~1"=="head" (
    echo --- head Manual ---
    echo head: Outputs the first part of a file.
    echo Usage: head [options] filename
    goto :EOF
)

if /I "%~1"=="history" (
    echo --- history Manual ---
    echo history: Displays the command history.
    echo Usage: history
    goto :EOF
)

if /I "%~1"=="ifconfig" (
    echo --- ifconfig Manual ---
    echo ifconfig: Configures or displays network interface parameters.
    echo Usage: ifconfig [interface]
    goto :EOF
)

if /I "%~1"=="kill" (
    echo --- kill Manual ---
    echo kill: Sends a signal to terminate a process.
    echo Usage: kill [signal] PID
    goto :EOF
)

if /I "%~1"=="last" (
    echo --- last Manual ---
    echo last: Displays a list of recent user logins.
    echo Usage: last
    goto :EOF
)

if /I "%~1"=="locate" (
    echo --- locate Manual ---
    echo locate: Quickly finds files by name.
    echo Usage: locate "filename"
    goto :EOF
)

if /I "%~1"=="ls" (
    echo --- ls Manual ---
    echo ls: Lists directory contents.
    echo Usage: ls [options] [directory]
    goto :EOF
)

if /I "%~1"=="man" (
    echo --- man Manual ---
    echo man: Displays the manual for a command.
    echo Usage: man command
    goto :EOF
)

if /I "%~1"=="mkdir-lin" (
    echo --- mkdir-lin Manual ---
    echo mkdir-lin: Creates a new directory.
    echo Usage: mkdir-lin directory
    goto :EOF
)

if /I "%~1"=="mv" (
    echo --- mv Manual ---
    echo mv: Moves or renames files and directories.
    echo Usage: mv source destination
    goto :EOF
)

if /I "%~1"=="ping-lin" (
    echo --- ping-lin Manual ---
    echo ping-lin: Checks network connectivity to a host.
    echo Usage: ping-lin hostname
    goto :EOF
)

if /I "%~1"=="ps" (
    echo --- ps Manual ---
    echo ps: Lists currently running processes.
    echo Usage: ps [options]
    goto :EOF
)

if /I "%~1"=="pwd" (
    echo --- pwd Manual ---
    echo pwd: Prints the current working directory.
    echo Usage: pwd
    goto :EOF
)

if /I "%~1"=="rm" (
    echo --- rm Manual ---
    echo rm: Removes files or directories.
    echo Usage: rm [options] filename
    goto :EOF
)

if /I "%~1"=="rsync" (
    echo --- rsync Manual ---
    echo rsync: Synchronizes files and directories between locations.
    echo Usage: rsync [options] source destination
    goto :EOF
)

if /I "%~1"=="scp" (
    echo --- scp Manual ---
    echo scp: Securely copies files between hosts.
    echo Usage: scp [options] source destination
    goto :EOF
)

if /I "%~1"=="sed" (
    echo --- sed Manual ---
    echo sed: Stream editor for filtering and transforming text.
    echo Usage: sed [options] "script" filename
    goto :EOF
)

if /I "%~1"=="sudo-lin" (
    echo --- sudo-lin Manual ---
    echo sudo-lin: Executes a command with elevated privileges.
    echo Usage: sudo-lin command [arguments]
    goto :EOF
)

if /I "%~1"=="tail" (
    echo --- tail Manual ---
    echo tail: Outputs the last part of a file.
    echo Usage: tail [options] filename
    goto :EOF
)

if /I "%~1"=="tar-lin" (
    echo --- tar-lin Manual ---
    echo tar-lin: Archives and extracts files.
    echo Usage: tar-lin [options] archive file(s)
    goto :EOF
)

if /I "%~1"=="top" (
    echo --- top Manual ---
    echo top: Displays active processes and resource usage.
    echo Usage: top
    goto :EOF
)

if /I "%~1"=="traceroute" (
    echo --- traceroute Manual ---
    echo traceroute: Traces the network route to a host.
    echo Usage: traceroute hostname
    goto :EOF
)

if /I "%~1"=="uname" (
    echo --- uname Manual ---
    echo uname: Prints system information.
    echo Usage: uname [options]
    goto :EOF
)

if /I "%~1"=="unzip" (
    echo --- unzip Manual ---
    echo unzip: Extracts files from a ZIP archive.
    echo Usage: unzip archive.zip
    goto :EOF
)

if /I "%~1"=="uptime" (
    echo --- uptime Manual ---
    echo uptime: Displays how long the system has been running.
    echo Usage: uptime
    goto :EOF
)

if /I "%~1"=="wget" (
    echo --- wget Manual ---
    echo wget: Downloads files from a URL.
    echo Options:
    echo    -O ^<filename^> : Specify the output filename.
    goto :EOF
)

if /I "%~1"=="whoami" (
    echo --- whoami Manual ---
    echo whoami: Displays the current user's name.
    echo Usage: whoami
    goto :EOF
)

if /I "%~1"=="winlin" (
    echo --- winlin Manual ---
    echo winlin: Launches the WinLin Linux emulation environment.
    echo Usage: winlin
    goto :EOF
)

if /I "%~1"=="zip" (
    echo --- zip Manual ---
    echo zip: Compresses files into a ZIP archive.
    echo Usage: zip [options] archive file(s)
    goto :EOF
)