@echo off
setlocal enabledelayedexpansion
chcp 65001
call setting.bat
rem ここまでおまじない
rem 設定次第で弾く
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

rem 無限ループ部分
:loop
	rem 設定再読み込み→設定秒数から30秒引く
	call setting.bat
	set /a interval=!autosaveinterval!-30
	rem メッセージ送信→30秒待機
	if !world_monitor_link! == 1 (
		echo まもなくオートセーブです。サーバーに入らないでください。 > file_io/out.txt
	) 
	nettool -p !nettoolpass! -s !serverip! say "Autosave soon."
	echo [!DATE! !TIME!]メッセージを送信しました。
	timeout /t 30 /nobreak >nul
	rem オートセーブ
	call module\worktime.bat START
	call module\autosave.bat
	if !world_monitor_link! == 1 (
		echo オートセーブが完了しました。 > file_io/out.txt
	) 
	call module\worktime.bat STOP
	rem 設定秒数からオートセーブにかかった秒数を減算
	set /a interval=!interval!-%DPS%
	timeout /t "!interval!" /nobreak >nul
goto loop