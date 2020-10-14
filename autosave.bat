@echo off
setlocal enabledelayedexpansion

call setting.bat

if !usingnettool! == 0 (
	echo このbatはsetting.bat内のusingnettoolを1にしないと使用できません。Enterキーを押すと終了します。
	pause >nul
	exit /b 0
) 
if !autosaveinterval! lss 60 (
	echo このbatはオートセーブの間隔が60秒以上でないと使用できません。Enterキーを押すと終了します。
	pause >nul
	exit /b 0
) 

set /a interval=!autosaveinterval!-30

:loop
nettool -p !nettoolpass! -s !serverip! say "Autosave soon."
echo [!DATE! !TIME!]メッセージを送信しました。
timeout /t 30 /nobreak >nul
call module\autosave.bat
timeout /t "!interval!" /nobreak >nul
goto loop