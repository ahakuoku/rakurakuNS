@echo off
setlocal enabledelayedexpansion
cd/d %~dp0
call module\setting_conv.bat
rem ここまでおまじない
rem 設定次第で弾く
if !use_nettool! == 0 (
	echo このbatはsetting.bat内のuse_nettoolを1にしないと使用できません。Enterキーを押すと終了します。
	pause >nul
	exit /b 0
) 
if !autosave_interval! lss 60 (
	echo このbatはオートセーブの間隔が60秒以上でないと使用できません。Enterキーを押すと終了します。
	pause >nul
	exit /b 0
) 

rem 無限ループ部分
:loop
	rem 設定再読み込み→設定秒数から30秒引く
	call module\setting_conv.bat
	set /a interval=!autosave_interval!-30
	rem メッセージ送信→30秒待機
	call module\Discord.bat まもなくオートセーブです。サーバーに入らないでください。
	nettool -p !nettool_password! -s !server_address! say "Autosave soon."
	echo [!DATE! !TIME!]メッセージを送信しました。
	timeout /t 30 /nobreak >nul
	rem オートセーブ
	call module\worktime.bat START
	call module\autosave.bat
	call module\Discord.bat オートセーブが完了しました。
	call module\worktime.bat STOP
	rem 設定秒数からオートセーブにかかった秒数を減算
	set /a interval=!interval!-%DPS%
	timeout /t "!interval!" /nobreak >nul
goto loop