chcp 65001
rem このファイルのみUTF-8
if !world_monitor_link! == 1 (
	set Discord_send_message=%1
	rem エラー対策で一時的に文字コードをUTF-8に変更	
	echo !Discord_send_message!>file_io/out.txt
) 
chcp 932