@echo off
setlocal enabledelayedexpansion

call setting.bat
rem �����܂ł��܂��Ȃ�
rem �ݒ莟��Œe��
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

rem �������[�v����
:loop
	rem �ݒ�ēǂݍ��݁��ݒ�b������30�b����
	call setting.bat
	set /a interval=!autosaveinterval!-30
	rem ���b�Z�[�W���M��30�b�ҋ@
	nettool -p !nettoolpass! -s !serverip! say "Autosave soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B
	timeout /t 30 /nobreak >nul
	rem �I�[�g�Z�[�u
	call module\worktime.bat START
	call module\autosave.bat
	call module\worktime.bat STOP
	rem �ݒ�b������I�[�g�Z�[�u�ɂ��������b�������Z
	set /a interval=!interval!-%DPS%
	timeout /t "!interval!" /nobreak >nul
goto loop