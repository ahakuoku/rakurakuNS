@echo off
setlocal enabledelayedexpansion

call setting.bat

if !usingnettool! == 0 (
	echo ����bat��setting.bat����usingnettool��1�ɂ��Ȃ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 

set /p strt_check="�����e�i���X���J�n���܂��B��낵���ł����H�iM/C/N�j�F "
if "!strt_check!" == "m" (
	nettool -p !nettoolpass! -s !serverip! say "Maintenance soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B�����ċN���c�[���͗��Ƃ��܂������H
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	nettool -p !nettoolpass! -s !serverip! say "Maintenance start."
	nettool -p !nettoolpass! -s !serverip! shutdown
) else if "!strt_check!"=="c" ( 
	nettool -p !nettoolpass! -s !serverip! say "Server close soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B�����ċN���c�[���͗��Ƃ��܂������H
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	nettool -p !nettoolpass! -s !serverip! say "Server closed. Thank you for playing at Server."
	nettool -p !nettoolpass! -s !serverip! shutdown
) else (
	echo "!strt_check!�F�����𒆎~���܂����B"
	pause >nul
	exit /b 0
) 