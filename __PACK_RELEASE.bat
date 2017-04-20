@echo off

echo.
echo ------ STARTING PACK RELEASE %1-%2 ------
set DEST=_RELEASE\_build\AllTheHaxx-%1-%2
mkdir %DEST%

copy *.dll %DEST% /Y
copy AllTheHaxx.exe %DEST% /Y
copy AllTheHaxx-NoLua.exe %DEST% /Y

echo Copying data...
xcopy data %DEST%\data\ /Q /s /e /Y

set EXCLUDE_FILE=%TMP%\ath-release-exclude-%1-%2.%RANDOM%
echo .git > %EXCLUDE_FILE%
echo .gitignore >> %EXCLUDE_FILE%
xcopy Lua-Scripts %DEST%\lua\ /EXCLUDE:%EXCLUDE_FILE% /s /e /Y

rem @echo on
:: cd _RELEASE\_build
cd %DEST%\..
:: %PACKS% will be _RELEASE\<VERSION>\packs
set PACKS=..\%1\packs
if not exist %PACKS% mkdir %PACKS%
7z a %PACKS%\AllTheHaxx-%1-%2.zip AllTheHaxx-%1-%2
7z a -sfx7z.sfx %PACKS%\AllTheHaxx-%1-%2.exe AllTheHaxx-%1-%2
copy AllTheHaxx-%1-%2\AllTheHaxx.exe %PACKS%\..\AllTheHaxx-%2.exe
copy AllTheHaxx-%1-%2\AllTheHaxx-NoLua.exe %PACKS%\..\AllTheHaxx-NoLua-%2.exe

rem cleanups
::rmdir /s /q AllTheHaxx-%1-%2
cd ..\..