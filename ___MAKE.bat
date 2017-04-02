@echo off
echo ~~~~~ MAKE ALLTHEHAXX %1 ~~~~~
echo.
echo ~~~~~~~ making 32 bit
call __BUILD_RELEASE.bat win32
echo ~~~~~~~ packing 32 bit
call __PACK_RELEASE.bat %1 win32

echo.
echo ~~~~~~~ making 64 bit
call __BUILD_RELEASE.bat win64
echo ~~~~~~~ packing 64 bit
call __PACK_RELEASE.bat %1 win64
echo.
pause