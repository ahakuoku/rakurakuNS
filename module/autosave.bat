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
call module\Discord.bat �܂��Ȃ��I�[�g�Z�[�u�ł��B�T�[�o�[�ɓ���Ȃ��ł��������B
nettool -p !nettool_password! -s !server_address! say "Autosave soon."
echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B
timeout /t 30 /nobreak >nul
rem �I�[�g�Z�[�u
call module\worktime.bat START
call module\save.bat
call module\Discord.bat �I�[�g�Z�[�u���������܂����B
call module\worktime.bat STOP
rem �ݒ�b������I�[�g�Z�[�u�ɂ��������b�������Z
set /a interval=!interval!-%DPS%
timeout /t "!interval!" /nobreak >nul