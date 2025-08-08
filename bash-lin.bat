@echo off
cls
setlocal EnableDelayedExpansion

:: ===== ���x�� for ���[�v =====
:start

:: ESC�i�G�X�P�[�v�j�����̎擾
for /f %%a in ('"prompt $E & for %%b in (1) do rem"') do set "ESC=%%a"

:: ANSI�J���[�i256�F�j
set "ESC256=%ESC%[38;5;"
set "FG_USERHOST=%ESC256%148m"
set "FG_HOME=%ESC256%75m"
set "FG_BRIGHTWHITE=%ESC256%15m"
set "FG_RED=%ESC%[31m"
set "RESET=%ESC%[0m"

:: ���[�U�[�E�z�X�g�E�z�[�����
set "USER=%USERNAME%"
set "HOST=%COMPUTERNAME%"
set "HOMEDIR=C:\Users\%USERNAME%"

:: �J�����g�f�B���N�g���擾
for /f "delims=" %%i in ('cd') do set "PWD=%%i"

:: �p�X�� Bash ���C�N�ɐ��`�FC:\Users\name �� ~/
set "DISPLAYPWD=!PWD:%HOMEDIR%=~/!"
set "DISPLAYPWD=!DISPLAYPWD:C:=~!"
set "DISPLAYPWD=!DISPLAYPWD:\=/!"

:: �J���[�v�����v�g�\��
<nul set /p "=!FG_USERHOST!!USER!@!HOST!!RESET!:!FG_HOME!!DISPLAYPWD!!FG_BRIGHTWHITE!$ !RESET!"
set /p USERINPUT=

:: ����͂Ȃ牽�����Ȃ�
set "STRIPPED="
for /f "tokens=* delims= " %%z in ("!USERINPUT!") do set "STRIPPED=%%z"
if /i "!STRIPPED!"=="" goto start

:: �I������
if /i "!USERINPUT!"=="exit" exit


:: �ꎞ�t�@�C���̏���
set "TMPERR=%TEMP%\winlin_err.log"
set "TMPOUT=%TEMP%\winlin_out.log"

:: �R�}���h���s�i�o�͂ƃG���[�𕪗��j
cmd /c "!USERINPUT!" 1>"!TMPOUT!" 2>"!TMPERR!"

:: �W���o�͂̕\��
for /f "delims=" %%o in (!TMPOUT!) do echo %%o

:: �G���[�s�̎擾�ƕ\��
set /p ERRLINE=<"!TMPERR!"
if not "!ERRLINE!"=="" (
    echo [[!FG_RED!X!RESET!]] !FG_RED!bash: '!USERINPUT!' �́A�����R�}���h�܂��͊O���R�}���h�A����\�ȃv���O�����܂��̓o�b�` �t�@�C���Ƃ��ĔF������Ă��܂���B!RESET!
)

:: �ꎞ�t�@�C���̍폜�ƕϐ�������
del /f /q "!TMPERR!" >nul 2>&1
del /f /q "!TMPOUT!" >nul 2>&1
set "ERRLINE="

echo.
goto start