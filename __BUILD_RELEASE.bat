@echo off

:: CLI arguments: <version> <platform>
echo :: BUILDING RELEASE %1 ::
ping localhost -n 3 >NUL

:: build with lua
echo.
echo ----- Building %1 with lua
ping localhost -n 2 >NUL

call _ENV-%1.bat
bam config
bam client_release
move /Y AllTheHaxx.exe AllTheHaxx.exe.1

:: build without lua
echo.
echo ----- Building %1 without lua
ping localhost -n 2 >NUL

echo lua.value=false >> config_%1.lua
bam client_release
move /Y AllTheHaxx.exe AllTheHaxx-NoLua.exe

move /Y AllTheHaxx.exe.1 AllTheHaxx.exe