rem -*- coding: shift_jis -*-
rem �ݒ莟��Œe��
call module\setting_conv.bat
if !use_nettool! == 0 (
	echo ����bat��setting.bat����use_nettool��1�ɂ��Ȃ��Ǝg�p�ł��܂���BEnter�L�[�������ƏI�����܂��B
	pause >nul
	exit /b 0
) 

rem �����I������
set /p strt_check="�����e�i���X���J�n���܂��B��낵���ł����H�im/c/n�j�F "
if "!strt_check!" == "m" (
	rem �����e�i���X�̏ꍇ
	call module\Discord.bat �܂��Ȃ������e�i���X�ł��B���ꂩ��̃��O�C���͂���߂��������B "{""description"":""���ꂩ��̃��O�C���͂���߂��������B"",""fields"":null,""title"":""�܂��Ȃ������e�i���X�ł��B"",""color"":16760576,""footer"":null}"
	nettool -p !nettool_password! -s !server_address! say "Maintenance soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B�����ċN���c�[���͗��Ƃ��܂������H
	timeout /t 30 /nobreak >nul
	call module\save.bat
	call module\Discord.bat �������܃����e�i���X���ł��B�����e�i���X���͐ڑ��ł���ꍇ������܂�������Ȃ��ł��������B "{""description"":""�����e�i���X���ł��T�[�o�[�ɓ����ꍇ������܂����A���Ȃ�����Ȃ��ł��������B"",""fields"":null,""title"":""�������܃����e�i���X���ł��B"",""color"":16760576,""footer"":null}"
	nettool -p !nettool_password! -s !server_address! say "Maintenance start."
	nettool -p !nettool_password! -s !server_address! shutdown
	timeout /t 30 /nobreak >nul
	call module\backup.bat
) else if "!strt_check!"=="c" ( 
	rem �T�[�o�[�I���̏ꍇ
	call module\Discord.bat �܂��Ȃ��T�[�o�[���I�����܂��B���ꂩ��̃��O�C���͂���߂��������B "{""description"":""���ꂩ��̃��O�C���͂���߂��������B"",""fields"":null,""title"":""�܂��Ȃ��T�[�o�[���I�����܂��B"",""color"":16760576,""footer"":null}"
	nettool -p !nettool_password! -s !server_address! say "Server close soon."
	echo [!DATE! !TIME!]���b�Z�[�W�𑗐M���܂����B�����ċN���c�[���͗��Ƃ��܂������H
	timeout /t 30 /nobreak >nul
	call module\save.bat
	call module\Discord.bat �T�[�o�[�͏I�����܂����B�F�l�̂��Q�����肪�Ƃ��������܂����B "{""description"":""�F�l�̂��Q�����肪�Ƃ��������܂����B"",""fields"":null,""title"":""�T�[�o�[�͏I�����܂����B"",""color"":65280,""footer"":null}"
	nettool -p !nettool_password! -s !server_address! say "Server closed. Thank you for playing at Server."
	nettool -p !nettool_password! -s !server_address! shutdown
	timeout /t 30 /nobreak >nul
	call module\backup.bat
) else (
	rem ����ȊO�̏ꍇ
	echo "!strt_check!�F�����𒆎~���܂����B"
	pause >nul
	exit /b 0
) 