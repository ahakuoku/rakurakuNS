rem -*- coding: shift_jis -*-
set /p autosave_launch="�I�[�g�Z�[�u�𓯎��N�����܂����H�iy/n�j�F "
start autostart.bat
if "!autosave_launch!" == "y" (
	start autosave.bat
) 

rem if "!world_monitor_link!" == 1 (
	rem cd/d !world_monitor_folder!
	rem python monitor.py
rem ) 