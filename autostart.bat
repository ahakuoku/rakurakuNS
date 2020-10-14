@echo off
setlocal enabledelayedexpansion

call setting.bat

rem 初回起動
tasklist | find !exename! > nul
if not errorlevel 1  (
	echo [!DATE! !TIME!]鯖は動いています。
	timeout /t 10 /nobreak >nul
) else (
	echo [!DATE! !TIME!]鯖を起動します。
	echo [!DATE! !TIME!]鯖を起動します。 >> autostart_log.txt
	if not exist !autosave! (
		echo [!DATE! !TIME!]!autosave!が見つかりません。!serversave!をコピーします。
		echo [!DATE! !TIME!]!autosave!が見つかりません。!serversave!をコピーします。 >> autostart_log.txt
		copy !serversave! !autosave!
	) else (
		echo [!DATE! !TIME!]!autosave!が見つかりました。このセーブデーターで起動します。
		echo [!DATE! !TIME!]!autosave!が見つかりました。このセーブデーターで起動します。 >> autostart_log.txt
	) 
	start !startfile!
	echo [!DATE! !TIME!]鯖を起動しました。
	echo [!DATE! !TIME!]鯖を起動しました。 >> autostart_log.txt
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
:loop
	call setting.bat
	rem 自動再起動
	tasklist | find !exename! > nul
	if not errorlevel 1  (
		echo [!DATE! !TIME!]鯖は動いています。
		timeout /t 10 /nobreak >nul
	) else (
		echo [!DATE! !TIME!]鯖落ちを検出しました。自動的に再起動します。
		echo [!DATE! !TIME!]鯖落ちを検出しました。自動的に再起動します。 >> autostart_log.txt
		if not exist !autosave! (
			echo [!DATE! !TIME!]!autosave!が見つかりません。!serversave!をコピーします。
			echo [!DATE! !TIME!]!autosave!が見つかりません。!serversave!をコピーします。 >> autostart_log.txt
			copy !serversave! !autosave!
		) else (
			echo [!DATE! !TIME!]!autosave!が見つかりました。このセーブデーターで起動します。
			echo [!DATE! !TIME!]!autosave!が見つかりました。このセーブデーターで起動します。 >> autostart_log.txt
		) 
		start !startfile!
		echo [!DATE! !TIME!]鯖を起動しました。
		echo [!DATE! !TIME!]鯖を起動しました。 >> autostart_log.txt
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