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
	nettool -p !nettoolpass! -s !serverip! say "Maintenance soon."
	echo [!DATE! !TIME!]メッセージを送信しました。自動再起動ツールは落としましたか？
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	nettool -p !nettoolpass! -s !serverip! say "Maintenance start."
	nettool -p !nettoolpass! -s !serverip! shutdown
	timeout /t 5 /nobreak >nul
	ren %exename% server_old.exe
	ren %new_filename% %exename%	
	start autostart.bat
) else (
	echo "!strt_check!：処理を中止しました。"
	pause >nul
	exit /b 0
) 