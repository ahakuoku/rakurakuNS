@echo off
setlocal enabledelayedexpansion
cd %~dp0
rem ここまでおまじない

:loop
call module\autosave.bat
goto loop