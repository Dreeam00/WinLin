@echo off
cls
setlocal EnableDelayedExpansion

:: ===== ラベル for ループ =====
:start

:: ESC（エスケープ）文字の取得
for /f %%a in ('"prompt $E & for %%b in (1) do rem"') do set "ESC=%%a"

:: ANSIカラー（256色）
set "ESC256=%ESC%[38;5;"
set "FG_USERHOST=%ESC256%148m"
set "FG_HOME=%ESC256%75m"
set "FG_BRIGHTWHITE=%ESC256%15m"
set "FG_RED=%ESC%[31m"
set "RESET=%ESC%[0m"

:: ユーザー・ホスト・ホーム情報
set "USER=%USERNAME%"
set "HOST=%COMPUTERNAME%"
set "HOMEDIR=C:\Users\%USERNAME%"

:: カレントディレクトリ取得
for /f "delims=" %%i in ('cd') do set "PWD=%%i"

:: パスを Bash ライクに整形：C:\Users\name → ~/
set "DISPLAYPWD=!PWD:%HOMEDIR%=~/!"
set "DISPLAYPWD=!DISPLAYPWD:C:=~!"
set "DISPLAYPWD=!DISPLAYPWD:\=/!"

:: カラープロンプト表示
<nul set /p "=!FG_USERHOST!!USER!@!HOST!!RESET!:!FG_HOME!!DISPLAYPWD!!FG_BRIGHTWHITE!$ !RESET!"
set /p USERINPUT=

:: 空入力なら何もしない
set "STRIPPED="
for /f "tokens=* delims= " %%z in ("!USERINPUT!") do set "STRIPPED=%%z"
if /i "!STRIPPED!"=="" goto start

:: 終了処理
if /i "!USERINPUT!"=="exit" exit


:: 一時ファイルの準備
set "TMPERR=%TEMP%\winlin_err.log"
set "TMPOUT=%TEMP%\winlin_out.log"

:: コマンド実行（出力とエラーを分離）
cmd /c "!USERINPUT!" 1>"!TMPOUT!" 2>"!TMPERR!"

:: 標準出力の表示
for /f "delims=" %%o in (!TMPOUT!) do echo %%o

:: エラー行の取得と表示
set /p ERRLINE=<"!TMPERR!"
if not "!ERRLINE!"=="" (
    echo [[!FG_RED!X!RESET!]] !FG_RED!bash: '!USERINPUT!' は、内部コマンドまたは外部コマンド、操作可能なプログラムまたはバッチ ファイルとして認識されていません。!RESET!
)

:: 一時ファイルの削除と変数初期化
del /f /q "!TMPERR!" >nul 2>&1
del /f /q "!TMPOUT!" >nul 2>&1
set "ERRLINE="

echo.
goto start