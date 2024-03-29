rem -*- coding: shift_jis -*-
rem バックアップ
if not exist autosave (
    md autosave
) 
if exist autosave\autosave_100.sve (
    del /q autosave\autosave_100.sve
) 
set backup_before=99
set backup_after=100
for /l %%i in (1,1,99) do (
    if exist autosave\autosave_!backup_before!.sve (
        ren autosave\autosave_!backup_before!.sve autosave_!backup_after!.sve
    ) 
    set /a backup_before-=1
    set /a backup_after-=1
) 
copy !server_save! autosave\autosave_1.sve