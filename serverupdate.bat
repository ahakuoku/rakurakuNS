@echo off
setlocal enabledelayedexpansion
cd/d %~dp0
call setting.bat
rem �����܂ł��܂��Ȃ�
rem �ݒ莟��Œe��
if !use_nettool! == 0 (
	echo ����bat��setting.bat����use_nettool��1�ɂ��Ȃ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 

rem �X�V��̖{�̂̃t�@�C��������

set /p new_filename="�V�����{�̂̃t�@�C��������͂��Ă��������B�un�v�Ɠ��͂���ƃL�����Z�����܂��B�F"
if "!new_filename!" == "n" (
	echo "!strt_check!�F�����𒆎~���܂����B"
	pause >nul
	exit /b 0
) 

rem �T�[�o�[���A�b�v�f�[�g

set /p strt_check="�T�[�o�[�̖{�̍X�V���J�n���܂��B��낵���ł����H�iY/N�j�F "
if "!strt_check!" == "y" (
	call module\Discord.bat �܂��Ȃ������e�i���X�ł��B���ꂩ��̃��O�C���͂���߂��������B
	nettool -p !nettool_password! -s !server_address! say "Maintenance soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B�����ċN���c�[���͗��Ƃ��܂������H
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	call module\Discord.bat �������܃����e�i���X���ł��B�����e�i���X���͐ڑ��ł���ꍇ������܂�������Ȃ��ł��������B
	nettool -p !nettool_password! -s !server_address! say "Maintenance start."
	nettool -p !nettool_password! -s !server_address! shutdown
	timeout /t 5 /nobreak >nul
	ren %chack_exe% server_old.exe
	ren %new_filename% %chack_exe%	
	start autostart.bat
) else (
	echo "!strt_check!�F�����𒆎~���܂����B"
	pause >nul
	exit /b 0
) 