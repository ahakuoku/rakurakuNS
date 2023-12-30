rem -*- coding: shift_jis -*-
rem オートセーブ
nettool -p !nettool_password! -s !server_address! force-sync
call module\company_locked.bat
echo [!DATE! !TIME!]オートセーブしました。