rem -*- coding: shift_jis -*-
rem �ݒ莟��Œe��
call module\setting_conv.bat
if !use_nettool! == 0 (
	echo ����bat��setting.bat����use_nettool��1�ɂ��Ȃ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 
if !autosave_interval! lss 60 (
	echo ����bat�̓I�[�g�Z�[�u�̊Ԋu��60�b�ȏ�łȂ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 

rem �ݒ�b������30�b����
set /a interval=!autosave_interval!-30
rem ���b�Z�[�W���M��30�b�ҋ@
call module\Discord.bat �܂��Ȃ��I�[�g�Z�[�u�ł��B�T�[�o�[�ɓ���Ȃ��ł��������B "{""description"":""�I�[�g�Z�[�u�����܂ŁA�T�[�o�[�ɓ���Ȃ��ł��������B"",""fields"":null,""title"":""�܂��Ȃ��I�[�g�Z�[�u�ł��B"",""color"":16760576,""footer"":null}"
nettool -p !nettool_password! -s !server_address! say "Autosave soon."
echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B
timeout /t 30 /nobreak >nul
rem �I�[�g�Z�[�u
call module\worktime.bat START
call module\save.bat
rem �o�b�N�A�b�v�܂�30�b�҂�
timeout /t 30 /nobreak >nul
call module\backup.bat
call module\Discord.bat �I�[�g�Z�[�u���������܂����B "{""description"":""�T�[�o�[�ɓ���ۂ́A�ߓx�ȃ��O�C�����b�V���̂Ȃ��悤�ɂ��肢���܂��B"",""fields"":null,""title"":""�I�[�g�Z�[�u���������܂����B"",""color"":65280,""footer"":null}"
call module\worktime.bat STOP
rem �ݒ�b������I�[�g�Z�[�u�ɂ��������b�������Z
set /a interval=!interval!-%DPS%
timeout /t "!interval!" /nobreak >nul