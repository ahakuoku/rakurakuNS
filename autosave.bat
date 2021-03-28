@echo off
setlocal enabledelayedexpansion
cd %~dp0
rem ‚±‚±‚Ü‚Å‚¨‚Ü‚¶‚È‚¢

:loop
call module\autosave.bat
goto loop