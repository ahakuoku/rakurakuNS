@echo off
setlocal enabledelayedexpansion
cd %~dp0
rem �����܂ł��܂��Ȃ�

:loop
call module\autosave.bat
goto loop