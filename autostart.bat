@echo off
setlocal enabledelayedexpansion

call setting.bat

rem ����N��
tasklist | find !exename! > nul
if not errorlevel 1  (
	echo [!DATE! !TIME!]�I�͓����Ă��܂��B
	timeout /t 10 /nobreak >nul
) else (
	echo [!DATE! !TIME!]�I���N�����܂��B
	echo [!DATE! !TIME!]�I���N�����܂��B >> autostart_log.txt
	if not exist !autosave! (
		echo [!DATE! !TIME!]!autosave!��������܂���B!serversave!���R�s�[���܂��B
		echo [!DATE! !TIME!]!autosave!��������܂���B!serversave!���R�s�[���܂��B >> autostart_log.txt
		copy !serversave! !autosave!
	) else (
		echo [!DATE! !TIME!]!autosave!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B
		echo [!DATE! !TIME!]!autosave!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B >> autostart_log.txt
	) 
	start !startfile!
	echo [!DATE! !TIME!]�I���N�����܂����B
	echo [!DATE! !TIME!]�I���N�����܂����B >> autostart_log.txt
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
:loop
	call setting.bat
	rem �����ċN��
	tasklist | find !exename! > nul
	if not errorlevel 1  (
		echo [!DATE! !TIME!]�I�͓����Ă��܂��B
		timeout /t 10 /nobreak >nul
	) else (
		echo [!DATE! !TIME!]�I���������o���܂����B�����I�ɍċN�����܂��B
		echo [!DATE! !TIME!]�I���������o���܂����B�����I�ɍċN�����܂��B >> autostart_log.txt
		if not exist !autosave! (
			echo [!DATE! !TIME!]!autosave!��������܂���B!serversave!���R�s�[���܂��B
			echo [!DATE! !TIME!]!autosave!��������܂���B!serversave!���R�s�[���܂��B >> autostart_log.txt
			copy !serversave! !autosave!
		) else (
			echo [!DATE! !TIME!]!autosave!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B
			echo [!DATE! !TIME!]!autosave!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B >> autostart_log.txt
		) 
		start !startfile!
		echo [!DATE! !TIME!]�I���N�����܂����B
		echo [!DATE! !TIME!]�I���N�����܂����B >> autostart_log.txt
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