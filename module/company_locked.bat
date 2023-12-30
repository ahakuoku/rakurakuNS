rem -*- coding: shift_jis -*-
rem nettoolを使用する設定において、会社IDが-1以外に設定されていた場合にのみ適用
if !use_nettool! == 1 (
	if not !company_password_1_number! == -1 (
		nettool -p !nettool_password! -s !server_address! lock-company !company_password_1_number! !company_password_1!
	) 
	if not !company_password_2_number! == -1 (
		nettool -p !nettool_password! -s !server_address! lock-company !company_password_2_number! !company_password_2!
	) 
	if not !company_password_3_number! == -1 (
		nettool -p !nettool_password! -s !server_address! lock-company !company_password_3_number! !company_password_3!
	) 
) 