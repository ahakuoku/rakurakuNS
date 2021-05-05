rem -*- coding: shift_jis -*-
rem 設定次第で弾く
call module\setting_conv.bat
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

rem 設定秒数から30秒引く
set /a interval=!autosave_interval!-30
rem メッセージ送信→30秒待機
call module\Discord.bat まもなくオートセーブです。サーバーに入らないでください。 "{""description"":""オートセーブ完了まで、サーバーに入らないでください。"",""fields"":null,""title"":""まもなくオートセーブです。"",""color"":16760576,""footer"":null}"
nettool -p !nettool_password! -s !server_address! say "Autosave soon."
echo [!DATE! !TIME!]メッセージを送信しました。
timeout /t 30 /nobreak >nul
rem オートセーブ
call module\worktime.bat START
call module\save.bat
rem バックアップまで30秒待つ
timeout /t 30 /nobreak >nul
call module\backup.bat
call module\Discord.bat オートセーブが完了しました。 "{""description"":""サーバーに入る際は、過度なログインラッシュのないようにお願いします。"",""fields"":null,""title"":""オートセーブが完了しました。"",""color"":65280,""footer"":null}"
call module\worktime.bat STOP
rem 設定秒数からオートセーブにかかった秒数を減算
set /a interval=!interval!-%DPS%
timeout /t "!interval!" /nobreak >nul