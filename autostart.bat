@echo off
setlocal enabledelayedexpansion
cd/d %~dp0
call setting.bat
rem �����܂ł��܂��Ȃ�
rem ����N��
rem �I�������Ă邩�`�F�b�N
tasklist | find !chack_exe! > nul
if not errorlevel 1  (
	echo [!DATE! !TIME!]�T�[�o�[�͓����Ă��܂��B
	timeout /t 10 /nobreak >nul
) else (
	rem �I�������Ă��Ȃ������ꍇ
	echo [!DATE! !TIME!]�T�[�o�[���N�����܂��B
	echo [!DATE! !TIME!]�T�[�o�[���N�����܂��B >> autostart_log.txt
	rem �Z�[�u�t�@�C���`�F�b�N
	if not exist !load_save! (
		echo [!DATE! !TIME!]!load_save!��������܂���B!server_save!���R�s�[���܂��B
		echo [!DATE! !TIME!]!load_save!��������܂���B!server_save!���R�s�[���܂��B >> autostart_log.txt
		copy !server_save! !load_save!
	) else (
		echo [!DATE! !TIME!]!load_save!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B
		echo [!DATE! !TIME!]!load_save!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B >> autostart_log.txt
	) 
	rem �I�N��
	start !launch_file!
	echo [!DATE! !TIME!]�T�[�o�[���N�����܂����B
	echo [!DATE! !TIME!]�T�[�o�[���N�����܂����B >> autostart_log.txt
	timeout /t 30 /nobreak >nul
	rem �ݒ莟��ŃX�y�[�X�L�[��������
	if !conflict_error_avoidance! == 1 (
		start module\space.vbs
		timeout /t 30 /nobreak >nul
	) 
	rem ��Ў������b�N�E����BAN
	if !use_nettool! == 1 (
		nettool -p !nettool_password! -s !server_address! lock-company 0 !topmost_company_password!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_1!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_2!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_3!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_4!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_5!
	) 
) 
rem �������[�v���� �ꕔ���ʂ��قȂ邱�ƁAbot�A�g�R�[�h�����邱�ƈȊO�͓���
:loop
	call setting.bat
	rem �����ċN��
	tasklist | find !chack_exe! > nul
	if not errorlevel 1  (
		echo [!DATE! !TIME!]�T�[�o�[�͓����Ă��܂��B
		timeout /t 10 /nobreak >nul
	) else (
		echo [!DATE! !TIME!]�T�[�o�[�_�E�������o���܂����B�����I�ɍċN�����܂��B
		echo [!DATE! !TIME!]�T�[�o�[�_�E�������o���܂����B�����I�ɍċN�����܂��B >> autostart_log.txt
		call module\Discord.bat �T�[�o�[�_�E�������o���܂����B���ݕ������ł��B���΂炭���҂����������B
		if not exist !load_save! (
			echo [!DATE! !TIME!]!load_save!��������܂���B!server_save!���R�s�[���܂��B
			echo [!DATE! !TIME!]!load_save!��������܂���B!server_save!���R�s�[���܂��B >> autostart_log.txt
			copy !server_save! !load_save!
		) else (
			echo [!DATE! !TIME!]!load_save!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B
			echo [!DATE! !TIME!]!load_save!��������܂����B���̃Z�[�u�f�[�^�[�ŋN�����܂��B >> autostart_log.txt
		) 
		start !launch_file!
		echo [!DATE! !TIME!]�T�[�o�[���N�����܂����B
		echo [!DATE! !TIME!]�T�[�o�[���N�����܂����B >> autostart_log.txt
		timeout /t 30 /nobreak >nul
		call module\Discord.bat �T�[�o�[���������܂����B
		if !conflict_error_avoidance! == 1 (
			start module\space.vbs
			timeout /t 30 /nobreak >nul
		) 
		if !use_nettool! == 1 (
			nettool -p !nettool_password! -s !server_address! lock-company 0 !topmost_company_password!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_1!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_2!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_3!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_4!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_5!
		) 
	) 
goto loop