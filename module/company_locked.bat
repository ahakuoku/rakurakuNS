rem -*- coding: shift_jis -*-
rem nettool���g�p����ݒ�ɂ����āA���ID��-1�ȊO�ɐݒ肳��Ă����ꍇ�ɂ̂ݓK�p
if !use_nettool! == 1 (
	if not !company_password_1_number! == -1 (
		for /f "usebackq delims=" %%A in (`nettool -p !nettool_password! -s !server_address! info-company !company_password_1_number!`) do set company_existence=%%A
		if not "!company_existence!" == "Nothing received." (
			nettool -p !nettool_password! -s !server_address! lock-company !company_password_1_number! !company_password_1!
		) 
	) 
	if not !company_password_2_number! == -1 (
		for /f "usebackq delims=" %%A in (`nettool -p !nettool_password! -s !server_address! info-company !company_password_2_number!`) do set company_existence=%%A
		if not "!company_existence!" == "Nothing received." (
			nettool -p !nettool_password! -s !server_address! lock-company !company_password_2_number! !company_password_2!
		) 
	) 
	if not !company_password_3_number! == -1 (
		for /f "usebackq delims=" %%A in (`nettool -p !nettool_password! -s !server_address! info-company !company_password_3_number!`) do set company_existence=%%A
		if not "!company_existence!" == "Nothing received." (
			nettool -p !nettool_password! -s !server_address! lock-company !company_password_3_number! !company_password_3!
		) 
	) 
) 