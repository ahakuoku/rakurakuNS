rem -*- coding: shift_jis -*-
rem �ݒ�ǂݍ���
call module\setting_conv.bat
rem �I�������Ă邩�`�F�b�N
tasklist | find !check_exe! > nul
if not errorlevel 1  (
	echo [!DATE! !TIME!]�T�[�o�[�͓����Ă��܂��B
	timeout /t 10 /nobreak >nul
) else (
	rem �I�������Ă��Ȃ������ꍇ
	rem ����N�����ǂ����ŕ��ʂ𕪂���
	if %1 == 0 (
		echo [!DATE! !TIME!]�T�[�o�[���N�����܂��B
		echo [!DATE! !TIME!]�T�[�o�[���N�����܂��B >> autostart_log.txt
	) else (
		echo [!DATE! !TIME!]�T�[�o�[�_�E�������o���܂����B�����I�ɍċN�����܂��B
		echo [!DATE! !TIME!]�T�[�o�[�_�E�������o���܂����B�����I�ɍċN�����܂��B >> autostart_log.txt
		call module\Discord.bat �T�[�o�[�_�E�������o���܂����B���ݕ������ł��B���΂炭���҂����������B "{""description"":""���ݕ������ł��B���΂炭���҂����������B"",""fields"":null,""title"":""�T�[�o�[�_�E�������o���܂����B"",""color"":16711680,""footer"":null}"
	) 
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
	rem ����N���łȂ��Ƃ�����Discord�Ƀ��b�Z�[�W�𓊂���
	if %1 == 1 (
		call module\Discord.bat �T�[�o�[���������܂����B "{""description"":""�T�[�o�[�ɓ���ۂ́A�ߓx�ȃ��O�C�����b�V���̂Ȃ��悤�ɂ��肢���܂��B"",""fields"":null,""title"":""�T�[�o�[���������܂����B"",""color"":65280,""footer"":null}"
	) 
	rem �ݒ莟��ŃX�y�[�X�L�[��������
	if !conflict_error_avoidance! == 1 (
		start module\space.vbs
		timeout /t 30 /nobreak >nul
	) 
	rem ��Ў������b�N�E����BAN
	call module\company_locked.bat
	if !use_nettool! == 1 (
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_1!
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_2!
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_3!
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_4!
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_5!
	) 
) 