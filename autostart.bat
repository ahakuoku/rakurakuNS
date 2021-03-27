@echo off
setlocal enabledelayedexpansion
cd/d %~dp0
call setting.bat
rem ここまでおまじない
rem 初回起動
rem 鯖が動いてるかチェック
tasklist | find !exename! > nul
if not errorlevel 1  (
	echo [!DATE! !TIME!]サーバーは動いています。
	timeout /t 10 /nobreak >nul
) else (
	rem 鯖が動いていなかった場合
	echo [!DATE! !TIME!]サーバーを起動します。
	echo [!DATE! !TIME!]サーバーを起動します。 >> autostart_log.txt
	rem セーブファイルチェック
	if not exist !autosave! (
		echo [!DATE! !TIME!]!autosave!が見つかりません。!serversave!をコピーします。
		echo [!DATE! !TIME!]!autosave!が見つかりません。!serversave!をコピーします。 >> autostart_log.txt
		copy !serversave! !autosave!
	) else (
		echo [!DATE! !TIME!]!autosave!が見つかりました。このセーブデーターで起動します。
		echo [!DATE! !TIME!]!autosave!が見つかりました。このセーブデーターで起動します。 >> autostart_log.txt
	) 
	rem 鯖起動
	start !startfile!
	echo [!DATE! !TIME!]サーバーを起動しました。
	echo [!DATE! !TIME!]サーバーを起動しました。 >> autostart_log.txt
	timeout /t 30 /nobreak >nul
	rem 設定次第でスペースキー自動押下
	if !pressspacekey! == 1 (
		start module\space.vbs
		timeout /t 30 /nobreak >nul
	) 
	rem 会社自動ロック・自動BAN
	if !usingnettool! == 1 (
		nettool -p !nettoolpass! -s !serverip! lock-company 0 !0companypass!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip1!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip2!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip3!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip4!
		nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip5!
	) 
) 
rem 無限ループ部分 一部文面が異なること、bot連携コードがあること以外は同一
:loop
	call setting.bat
	rem 自動再起動
	tasklist | find !exename! > nul
	if not errorlevel 1  (
		echo [!DATE! !TIME!]サーバーは動いています。
		timeout /t 10 /nobreak >nul
	) else (
		echo [!DATE! !TIME!]サーバーダウンを検出しました。自動的に再起動します。
		echo [!DATE! !TIME!]サーバーダウンを検出しました。自動的に再起動します。 >> autostart_log.txt
		call module\Discord.bat サーバーダウンを検出しました。現在復旧中です。しばらくお待ちください。
		if not exist !autosave! (
			echo [!DATE! !TIME!]!autosave!が見つかりません。!serversave!をコピーします。
			echo [!DATE! !TIME!]!autosave!が見つかりません。!serversave!をコピーします。 >> autostart_log.txt
			copy !serversave! !autosave!
		) else (
			echo [!DATE! !TIME!]!autosave!が見つかりました。このセーブデーターで起動します。
			echo [!DATE! !TIME!]!autosave!が見つかりました。このセーブデーターで起動します。 >> autostart_log.txt
		) 
		start !startfile!
		echo [!DATE! !TIME!]サーバーを起動しました。
		echo [!DATE! !TIME!]サーバーを起動しました。 >> autostart_log.txt
		call module\Discord.bat サーバーが復旧しました。
		timeout /t 30 /nobreak >nul
		if !pressspacekey! == 1 (
			start module\space.vbs
			timeout /t 30 /nobreak >nul
		) 
		if !usingnettool! == 1 (
			nettool -p !nettoolpass! -s !serverip! lock-company 0 !0companypass!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip1!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip2!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip3!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip4!
			nettool -p !nettoolpass! -s !serverip! ban-ip !ban-ip5!
		) 
	) 
goto loop