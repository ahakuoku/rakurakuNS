@echo off
setlocal enabledelayedexpansion

call setting.bat

if !usingnettool! == 0 (
	echo ����bat��setting.bat����usingnettool��1�ɂ��Ȃ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 
if !autosaveinterval! lss 60 (
	echo ����bat�̓I�[�g�Z�[�u�̊Ԋu��60�b�ȏ�łȂ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 

:loop
call setting.bat
set /a interval=!autosaveinterval!-30
nettool -p !nettoolpass! -s !serverip! say "Autosave soon."
echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B
timeout /t 30 /nobreak >nul
call module\autosave.bat
timeout /t "!interval!" /nobreak >nul
goto loop