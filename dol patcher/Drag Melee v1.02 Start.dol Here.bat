@echo off	

echo #######################
echo ##                   ##
echo ##                   ##
echo ## m-ex .dol Patcher ##
echo ##                   ##
echo ##                   ##
echo #######################
echo.

echo Creating m-ex .dol...
echo.

cd /d %~dp0

xdelta.exe -d -f -s %1 "patch.xdelta" "main.dol"

echo.
echo Done!
echo main.dol is located in the current folder!

pause