@echo on

schtasks /create /sc onstart /tn DeleteOldUser /tr %~dp0delete_old_user_dir.bat
pause