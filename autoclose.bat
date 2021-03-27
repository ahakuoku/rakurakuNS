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

rem 自動終了部分
set /p strt_check="メンテナンスを開始します。よろしいですか？（M/C/N）： "
if "!strt_check!" == "m" (
	rem メンテナンスの場合
	nettool -p !nettoolpass! -s !serverip! say "Maintenance soon."
	echo [!DATE! !TIME!]メッセージを送信しました。自動再起動ツールは落としましたか？
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	nettool -p !nettoolpass! -s !serverip! say "Maintenance start."
	nettool -p !nettoolpass! -s !serverip! shutdown
	) else if "!strt_check!"=="c" ( 
	rem サーバー終了の場合
	nettool -p !nettoolpass! -s !serverip! say "Server close soon."
	echo [!DATE! !TIME!]メッセージを送信しました。自動再起動ツールは落としましたか？
	timeout /t 30 /nobreak >nul
	call module\autosave.bat
	nettool -p !nettoolpass! -s !serverip! say "Server closed. Thank you for playing at Server."
	nettool -p !nettoolpass! -s !serverip! shutdown
) else (
	rem それ以外の場合
	echo "!strt_check!：処理を中止しました。"
	pause >nul
	exit /b 0
) 