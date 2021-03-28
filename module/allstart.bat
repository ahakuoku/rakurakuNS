@echo off
setlocal enabledelayedexpansion
cd %~dp0
rem ここまでおまじない
set /p autosave_launch="オートセーブを同時起動しますか？（Y/N）： "
start autostart.bat
if "!autostart_launch!" == "y" (
	start autosave.bat
) 
if "!world_monitor_link!" == 1 (
	cd/d !world_monitor_folder!
	python monitor.py
) 