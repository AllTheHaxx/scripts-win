@echo off

echo.
echo ------ STARTING PACK RELEASE %1-%2 ------
set DEST=_RELEASE\AllTheHaxx-%1-%2
mkdir %DEST% >NUL

copy *.dll %DEST% /Y
copy AllTheHaxx.exe %DEST% /Y
copy AllTheHaxx-NoLua.exe %DEST% /Y

echo Copying data...
xcopy data %DEST%\data\ /Q /s /e /Y

set EXCLUDE_FILE=%TMP%\ath-release-exclude-%1-%2.%RANDOM%
echo .git > %EXCLUDE_FILE%
echo .gitignore >> %EXCLUDE_FILE%
xcopy Lua-Scripts %DEST%\lua\ /EXCLUDE:%EXCLUDE_FILE% /s /e /Y

cd %DEST%\..
7z a AllTheHaxx-%1-%2.zip AllTheHaxx-%1-%2
7z a -sfx7zCon.sfx AllTheHaxx-%1-%2.exe AllTheHaxx-%1-%2
cd ..