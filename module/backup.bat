rem -*- coding: shift_jis -*-
rem バックアップ
If not exist autosave mkdir autosave
If exist autosave\autosave_100.sve del /q autosave\autosave_100.sve
for /l %%i in (99,-1,1) do (
    set !autosave_backup!=%%i
    set /a !autosave_backup!+=1
    if exist autosave\autosave_%%i.sve ren autosave\autosave_%%i.sve autosave_%autosave_backup%.sve
) 
copy !server_save! autosave\autosave_1.sve