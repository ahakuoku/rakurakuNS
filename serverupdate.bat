@echo off
setlocal enabledelayedexpansion

call setting.bat

if !usingnettool! == 0 (
	echo このbatはsetting.bat内のusingnettoolを1にしないと使用できません。Enterキーを押すと終了します。
	pause >nul
	exit /b 0
) 

set /p new_filename="新しい本体のファイル名を入力してください。「n」と入力するとキャンセルします。："
if "!new_filename!" == "n" (
	echo "!strt_check!：処理を中止しました。"
	pause >nul
	exit /b 0
) 

set /p strt_check="サーバーの本体更新を開始します。よろしいですか？（Y/N）： "
if "!strt_check!" == "y" (
	nettool -p !nettoolpass! -s !serverip! say "Maintenance soon."
	echo [!DATE! !TIME!]メッセージを送信しました。自動再起動ツールは落としましたか？
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	nettool -p !nettoolpass! -s !serverip! say "Maintenance start."
	nettool -p !nettoolpass! -s !serverip! shutdown
	ren %exename% server_old.exe
	ren %new_filename% %exename%
	timeout /t 2 /nobreak >nul	
	start autostart.bat
) else (
	echo "!strt_check!：処理を中止しました。"
	pause >nul
	exit /b 0
) 