@echo off
setlocal enabledelayedexpansion
cd %~dp0
rem �����܂ł��܂��Ȃ�
set /p autosave_launch="�I�[�g�Z�[�u�𓯎��N�����܂����H�iY/N�j�F "
start autostart.bat
if "!autostart_launch!" == "y" (
	start autosave.bat
) 
if "!world_monitor_link!" == 1 (
	cd/d !world_monitor_folder!
	python monitor.py
) 