@echo off
setlocal enabledelayedexpansion

call setting.bat

if !usingnettool! == 0 (
	echo ����bat��setting.bat����usingnettool��1�ɂ��Ȃ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 

set /p new_filename="�V�����{�̂̃t�@�C��������͂��Ă��������B�un�v�Ɠ��͂���ƃL�����Z�����܂��B�F"
if "!new_filename!" == "n" (
	echo "!strt_check!�F�����𒆎~���܂����B"
	pause >nul
	exit /b 0
) 

set /p strt_check="�T�[�o�[�̖{�̍X�V���J�n���܂��B��낵���ł����H�iY/N�j�F "
if "!strt_check!" == "y" (
	nettool -p !nettoolpass! -s !serverip! say "Maintenance soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B�����ċN���c�[���͗��Ƃ��܂������H
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	nettool -p !nettoolpass! -s !serverip! say "Maintenance start."
	nettool -p !nettoolpass! -s !serverip! shutdown
	ren %exename% server_old.exe
	ren %new_filename% %exename%
	timeout /t 2 /nobreak >nul	
	start autostart.bat
) else (
	echo "!strt_check!�F�����𒆎~���܂����B"
	pause >nul
	exit /b 0
) 