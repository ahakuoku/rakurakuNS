@echo off
setlocal enabledelayedexpansion
cd/d %~dp0
call setting.bat
rem �����܂ł��܂��Ȃ�
rem ����N��
rem �I�������Ă邩�`�F�b�N
tasklist | find !exename! > nul
if not errorlevel 1  (
	echo [!DATE! !TIME!]�T�[�o�[�͓����Ă��܂��B
	timeout /t 10 /nobreak >nul
) else (
	rem �I�������Ă��Ȃ������ꍇ
	echo [!DATE! !TIME!]�T�[�o�[���N�����܂��B
	echo [!DATE! !TIME!]�T�[�o�[���N�����܂��B >> autostart_log.txt
	rem �Z�[�u�t�@�C���`�F�b�N
	if not exist !autosave! (
		echo [!DATE! !TIME!]!autosave!��������܂���B!serversave!���R�s�[���܂��B
		echo [!DATE! !TIME!]!autosave!��������܂���B!serversave!���R�s�[���܂��B >> autostart_log.txt
		copy !serversave! !autosave!
	) else (
		echo [!DATE! !TIME!]!autosave!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B
		echo [!DATE! !TIME!]!autosave!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B >> autostart_log.txt
	) 
	rem �I�N��
	start !startfile!
	echo [!DATE! !TIME!]�T�[�o�[���N�����܂����B
	echo [!DATE! !TIME!]�T�[�o�[���N�����܂����B >> autostart_log.txt
	timeout /t 30 /nobreak >nul
	rem �ݒ莟��ŃX�y�[�X�L�[��������
	if !pressspacekey! == 1 (
		start module\space.vbs
		timeout /t 30 /nobreak >nul
	) 
	rem ��Ў������b�N�E����BAN
	if !usingnettool! == 1 (
		nettool -p !nettoolpass! -s !serverip! lock-company 0 !0companypass!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip1!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip2!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip3!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip4!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip5!
	) 
) 
rem �������[�v���� �ꕔ���ʂ��قȂ邱�ƁAbot�A�g�R�[�h�����邱�ƈȊO�͓���
:loop
	call setting.bat
	rem �����ċN��
	tasklist | find !exename! > nul
	if not errorlevel 1  (
		echo [!DATE! !TIME!]�T�[�o�[�͓����Ă��܂��B
		timeout /t 10 /nobreak >nul
	) else (
		echo [!DATE! !TIME!]�T�[�o�[�_�E�������o���܂����B�����I�ɍċN�����܂��B
		echo [!DATE! !TIME!]�T�[�o�[�_�E�������o���܂����B�����I�ɍċN�����܂��B >> autostart_log.txt
		call module\Discord.bat �T�[�o�[�_�E�������o���܂����B���ݕ������ł��B���΂炭���҂����������B
		if not exist !autosave! (
			echo [!DATE! !TIME!]!autosave!��������܂���B!serversave!���R�s�[���܂��B
			echo [!DATE! !TIME!]!autosave!��������܂���B!serversave!���R�s�[���܂��B >> autostart_log.txt
			copy !serversave! !autosave!
		) else (
			echo [!DATE! !TIME!]!autosave!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B
			echo [!DATE! !TIME!]!autosave!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B >> autostart_log.txt
		) 
		start !startfile!
		echo [!DATE! !TIME!]�T�[�o�[���N�����܂����B
		echo [!DATE! !TIME!]�T�[�o�[���N�����܂����B >> autostart_log.txt
		call module\Discord.bat �T�[�o�[���������܂����B
		timeout /t 30 /nobreak >nul
		if !pressspacekey! == 1 (
			start module\space.vbs
			timeout /t 30 /nobreak >nul
		) 
		if !usingnettool! == 1 (
			nettool -p !nettoolpass! -s !serverip! lock-company 0 !0companypass!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip1!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip2!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip3!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip4!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip5!
		) 
	) 
goto loop