@echo off
setlocal enabledelayedexpansion
cd/d %~dp0
call setting.bat
rem �����܂ł��܂��Ȃ�
rem �ݒ莟��Œe��
if !usingnettool! == 0 (
	echo ����bat��setting.bat����usingnettool��1�ɂ��Ȃ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 

rem �����I������
set /p strt_check="�����e�i���X���J�n���܂��B��낵���ł����H�iM/C/N�j�F "
if "!strt_check!" == "m" (
	rem �����e�i���X�̏ꍇ
	call module\Discord.bat �܂��Ȃ������e�i���X�ł��B���ꂩ��̃��O�C���͂���߂��������B
	nettool -p !nettoolpass! -s !serverip! say "Maintenance soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B�����ċN���c�[���͗��Ƃ��܂������H
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	call module\Discord.bat �������܃����e�i���X���ł��B�����e�i���X���͐ڑ��ł���ꍇ������܂�������Ȃ��ł��������B
	nettool -p !nettoolpass! -s !serverip! say "Maintenance start."
	nettool -p !nettoolpass! -s !serverip! shutdown
) else if "!strt_check!"=="c" ( 
	rem �T�[�o�[�I���̏ꍇ
	call module\Discord.bat �܂��Ȃ��T�[�o�[���I�����܂��B���ꂩ��̃��O�C���͂���߂��������B
	nettool -p !nettoolpass! -s !serverip! say "Server close soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B�����ċN���c�[���͗��Ƃ��܂������H
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	call module\Discord.bat �T�[�o�[�͏I�����܂����B�F�l�̂��Q�����肪�Ƃ��������܂����B
	nettool -p !nettoolpass! -s !serverip! say "Server closed. Thank you for playing at Server."
	nettool -p !nettoolpass! -s !serverip! shutdown
) else (
	rem ����ȊO�̏ꍇ
	echo "!strt_check!�F�����𒆎~���܂����B"
	pause >nul
	exit /b 0
) 