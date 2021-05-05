rem -*- coding: shift_jis -*-
rem 設定次第で弾く
call module\setting_conv.bat
if !use_nettool! == 0 (
	echo このbatはsetting.bat内のuse_nettoolを1にしないと使用できません。Enterキーを押すと終了します。
	pause >nul
	exit /b 0
) 

rem 自動終了部分
set /p strt_check="メンテナンスを開始します。よろしいですか？（m/c/n）： "
if "!strt_check!" == "m" (
	rem メンテナンスの場合
	call module\Discord.bat まもなくメンテナンスです。これからのログインはおやめください。 "{""description"":""これからのログインはおやめください。"",""fields"":null,""title"":""まもなくメンテナンスです。"",""color"":16760576,""footer"":null}"
	nettool -p !nettool_password! -s !server_address! say "Maintenance soon."
	echo [!DATE! !TIME!]メッセージを送信しました。自動再起動ツールは落としましたか？
	timeout /t 30 /nobreak >nul
	call module\save.bat
	call module\Discord.bat ただいまメンテナンス中です。メンテナンス中は接続できる場合がありますが入らないでください。 "{""description"":""メンテナンス中でもサーバーに入れる場合がありますが、許可なく入らないでください。"",""fields"":null,""title"":""ただいまメンテナンス中です。"",""color"":16760576,""footer"":null}"
	nettool -p !nettool_password! -s !server_address! say "Maintenance start."
	nettool -p !nettool_password! -s !server_address! shutdown
	timeout /t 30 /nobreak >nul
	call module\backup.bat
) else if "!strt_check!"=="c" ( 
	rem サーバー終了の場合
	call module\Discord.bat まもなくサーバーが終了します。これからのログインはおやめください。 "{""description"":""これからのログインはおやめください。"",""fields"":null,""title"":""まもなくサーバーが終了します。"",""color"":16760576,""footer"":null}"
	nettool -p !nettool_password! -s !server_address! say "Server close soon."
	echo [!DATE! !TIME!]メッセージを送信しました。自動再起動ツールは落としましたか？
	timeout /t 30 /nobreak >nul
	call module\save.bat
	call module\Discord.bat サーバーは終了しました。皆様のご参加ありがとうございました。 "{""description"":""皆様のご参加ありがとうございました。"",""fields"":null,""title"":""サーバーは終了しました。"",""color"":65280,""footer"":null}"
	nettool -p !nettool_password! -s !server_address! say "Server closed. Thank you for playing at Server."
	nettool -p !nettool_password! -s !server_address! shutdown
	timeout /t 30 /nobreak >nul
	call module\backup.bat
) else (
	rem それ以外の場合
	echo "!strt_check!：処理を中止しました。"
	pause >nul
	exit /b 0
) 