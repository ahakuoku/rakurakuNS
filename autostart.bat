@echo off
setlocal enabledelayedexpansion
cd %~dp0
rem ‚±‚±‚Ü‚Å‚¨‚Ü‚¶‚È‚¢
call module\autostart.bat 0
:loop
call module\autostart.bat 1
goto loop