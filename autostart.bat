@echo off
setlocal enabledelayedexpansion
cd %~dp0
rem �����܂ł��܂��Ȃ�
call module\autostart.bat 0
:loop
call module\autostart.bat 1
goto loop