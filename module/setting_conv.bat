call setting.bat
if "!use_nettool!" == "" (
	if "!usingnettool!" == "" (
		set use_nettool=0
	) else (
		set use_nettool=!usingnettool!
	) 
) 
if "!nettool_password!" == "" (
	if "!nettoolpass!" == "" (
		set nettool_password=""
	) else (
		set nettool_password=!nettoolpass!
	) 
) 
if "!launch_file!" == "" (
	if "!startfile!" == "" (
		set launch_file=sim-WinGDI64-OTRP.exe
	) else (
		set launch_file=!startfile!
	) 
) 
if "!server_save!" == "" (
	if "!serversave!" == "" (
		set server_save=server13353-network.sve
	) else (
		set server_save=!serversave!
	) 
) 
if "!load_save!" == "" (
	if "!autosave!" == "" (
		set load_save=autosave-pak.sve
	) else (
		set load_save=!autosave!
	) 
) 
if "!check_exe!" == "" (
	if "!exename!" == "" (
		set check_exe="sim-WinGDI64-OTRP.exe"
	) else (
		set check_exe=!exename!
	) 
) 
if "!server_address!" == "" (
	if "!serverip!" == "" (
		set server_address="127.0.0.1:13353"
	) else (
		set server_address=!serverip!
	) 
) 
if "!topmost_company_password!" == "" (
	if "!0companypass!" == "" (
		set topmost_company_password=""
	) else (
		set topmost_company_password=!0companypass!
	) 
) 
if "!autosave_interval!" == "" (
	if "!autosaveinterval!" == "" (
		set autosave_interval=""
	) else (
		set autosave_interval=!autosaveinterval!
	) 
) 
if "!conflict_error_avoidance!" == "" (
	if "!pressspacekey!" == "" (
		set conflict_error_avoidance=""
	) else (
		set conflict_error_avoidance=!pressspacekey!
	) 
) 
if "!ban_address_1!" == "" (
	if "!ban-ip1!" == "" (
		set ban_address_1=""
	) else (
		set ban_address_1=!ban-ip1!
	) 
) 
if "!ban_address_2!" == "" (
	if "!ban-ip2!" == "" (
		set ban_address_2=""
	) else (
		set ban_address_2=!ban-ip2!
	) 
) 
if "!ban_address_3!" == "" (
	if "!ban-ip3!" == "" (
		set ban_address_3=""
	) else (
		set ban_address_3=!ban-ip3!
	) 
) 
if "!ban_address_4!" == "" (
	if "!ban-ip4!" == "" (
		set ban_address_4=""
	) else (
		set ban_address_4=!ban-ip4!
	) 
) 
if "!ban_address_5!" == "" (
	if "!ban-ip5!" == "" (
		set ban_address_5=""
	) else (
		set ban_address_5=!ban-ip5!
	) 
) 