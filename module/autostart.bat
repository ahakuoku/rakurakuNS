rem -*- coding: shift_jis -*-
rem 設定読み込み
call module\setting_conv.bat
rem 鯖が動いてるかチェック
tasklist | find !check_exe! > nul
if not errorlevel 1  (
	echo [!DATE! !TIME!]サーバーは動いています。
	timeout /t 10 /nobreak >nul
) else (
	rem 鯖が動いていなかった場合
	rem 初回起動かどうかで文面を分ける
	if %1 == 0 (
		echo [!DATE! !TIME!]サーバーを起動します。
		echo [!DATE! !TIME!]サーバーを起動します。 >> autostart_log.txt
	) else (
		echo [!DATE! !TIME!]サーバーダウンを検出しました。自動的に再起動します。
		echo [!DATE! !TIME!]サーバーダウンを検出しました。自動的に再起動します。 >> autostart_log.txt
		call module\Discord.bat サーバーダウンを検出しました。現在復旧中です。しばらくお待ちください。 "{""description"":""現在復旧中です。しばらくお待ちください。"",""fields"":null,""title"":""サーバーダウンを検出しました。"",""color"":16711680,""footer"":null}"
	) 
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
	rem 初回起動でないときだけDiscordにメッセージを投げる
	if %1 == 1 (
		call module\Discord.bat サーバーが復旧しました。 "{""description"":""サーバーに入る際は、過度なログインラッシュのないようにお願いします。"",""fields"":null,""title"":""サーバーが復旧しました。"",""color"":65280,""footer"":null}"
	) 
	rem 設定次第でスペースキー自動押下
	if !conflict_error_avoidance! == 1 (
		start module\space.vbs
		timeout /t 30 /nobreak >nul
	) 
	rem 会社自動ロック・自動BAN
	call module\company_locked.bat
	if !use_nettool! == 1 (
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_1!
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_2!
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_3!
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_4!
		nettool -p !nettool_password! -s !server_address! ban-ip !ban_address_5!
	) 
) 