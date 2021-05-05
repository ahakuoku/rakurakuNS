rem -*- coding: utf-8 -*-
chcp 65001
rem このファイルのみエラー対策でUTF-8
if !world_monitor_link! == 1 (
	set Discord_send_message=%~1
	echo !Discord_send_message!>file_io/out.txt
) else if !world_monitor_link! == 2 (
	set Discord_send_message=%~2
	set Discord_send_message=!Discord_send_message:""="!
	echo !Discord_send_message!>file_io/out_embed.json
) 
chcp 932