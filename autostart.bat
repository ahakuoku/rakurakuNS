@echo off
setlocal enabledelayedexpansion
cd/d %~dp0
call setting.bat
rem ここまでおまじない
rem 初回起動
rem 鯖が動いてるかチェック
tasklist | find !chack_exe! > nul
if not errorlevel 1  (
	echo [!DATE! !TIME!]サーバーは動いています。
	timeout /t 10 /nobreak >nul
) else (
	rem 鯖が動いていなかった場合
	echo [!DATE! !TIME!]サーバーを起動します。
	echo [!DATE! !TIME!]サーバーを起動します。 >> autostart_log.txt
	rem セーブファイルチェック
	if not exist !load_save! (
		echo [!DATE! !TIME!]!load_save!が見つかりません。!server_save!をコピーします。
		echo [!DATE! !TIME!]!load_save!が見つかりません。!server_save!をコピーします。 >> autostart_log.txt
		copy !server_save! !load_save!
	) else (
		echo [!DATE! !TIME!]!load_save!が見つかりました。このセーブデーターで起動します。
		echo [!DATE! !TIME!]!load_save!が見つかりました。このセーブデーターで起動します。 >> autostart_log.txt
	) 
	rem 鯖起動
	start !launch_file!
	echo [!DATE! !TIME!]サーバーを起動しました。
	echo [!DATE! !TIME!]サーバーを起動しました。 >> autostart_log.txt
	timeout /t 30 /nobreak >nul
	rem 設定次第でスペースキー自動押下
	if !conflict_error_avoidance! == 1 (
		start module\space.vbs
		timeout /t 30 /nobreak >nul
	) 
	rem 会社自動ロック・自動BAN
	if !use_nettool! == 1 (
		nettool -p !nettool_password! -s !server_address! lock-company 0 !topmost_company_password!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_1!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_2!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_3!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_4!
		nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_5!
	) 
) 
rem 無限ループ部分 一部文面が異なること、bot連携コードがあること以外は同一
:loop
	call setting.bat
	rem 自動再起動
	tasklist | find !chack_exe! > nul
	if not errorlevel 1  (
		echo [!DATE! !TIME!]サーバーは動いています。
		timeout /t 10 /nobreak >nul
	) else (
		echo [!DATE! !TIME!]サーバーダウンを検出しました。自動的に再起動します。
		echo [!DATE! !TIME!]サーバーダウンを検出しました。自動的に再起動します。 >> autostart_log.txt
		call module\Discord.bat サーバーダウンを検出しました。現在復旧中です。しばらくお待ちください。
		if not exist !load_save! (
			echo [!DATE! !TIME!]!load_save!が見つかりません。!server_save!をコピーします。
			echo [!DATE! !TIME!]!load_save!が見つかりません。!server_save!をコピーします。 >> autostart_log.txt
			copy !server_save! !load_save!
		) else (
			echo [!DATE! !TIME!]!load_save!が見つかりました。このセーブデーターで起動します。
			echo [!DATE! !TIME!]!load_save!が見つかりました。このセーブデーターで起動します。 >> autostart_log.txt
		) 
		start !launch_file!
		echo [!DATE! !TIME!]サーバーを起動しました。
		echo [!DATE! !TIME!]サーバーを起動しました。 >> autostart_log.txt
		timeout /t 30 /nobreak >nul
		call module\Discord.bat サーバーが復旧しました。
		if !conflict_error_avoidance! == 1 (
			start module\space.vbs
			timeout /t 30 /nobreak >nul
		) 
		if !use_nettool! == 1 (
			nettool -p !nettool_password! -s !server_address! lock-company 0 !topmost_company_password!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_1!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_2!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_3!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_4!
			nettool -p !nettool_password! -s !server_address! ban_address_ !ban_address_5!
		) 
	) 
goto loop