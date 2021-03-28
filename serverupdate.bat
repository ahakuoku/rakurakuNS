@echo off
setlocal enabledelayedexpansion
cd/d %~dp0
call setting.bat
rem ここまでおまじない
rem 設定次第で弾く
if !use_nettool! == 0 (
	echo このbatはsetting.bat内のuse_nettoolを1にしないと使用できません。Enterキーを押すと終了します。
	pause >nul
	exit /b 0
) 

rem 更新後の本体のファイル名入力

set /p new_filename="新しい本体のファイル名を入力してください。「n」と入力するとキャンセルします。："
if "!new_filename!" == "n" (
	echo "!strt_check!：処理を中止しました。"
	pause >nul
	exit /b 0
) 

rem サーバーをアップデート

set /p strt_check="サーバーの本体更新を開始します。よろしいですか？（Y/N）： "
if "!strt_check!" == "y" (
	call module\Discord.bat まもなくメンテナンスです。これからのログインはおやめください。
	nettool -p !nettool_password! -s !server_address! say "Maintenance soon."
	echo [!DATE! !TIME!]メッセージを送信しました。自動再起動ツールは落としましたか？
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	call module\Discord.bat ただいまメンテナンス中です。メンテナンス中は接続できる場合がありますが入らないでください。
	nettool -p !nettool_password! -s !server_address! say "Maintenance start."
	nettool -p !nettool_password! -s !server_address! shutdown
	timeout /t 5 /nobreak >nul
	ren %chack_exe% server_old.exe
	ren %new_filename% %chack_exe%	
	start autostart.bat
) else (
	echo "!strt_check!：処理を中止しました。"
	pause >nul
	exit /b 0
) 