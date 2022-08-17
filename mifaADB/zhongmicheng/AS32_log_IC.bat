@echo off
adb -host kill-server
echo 设备正在连接...
adb -host wait-for-devices
cls
echo 设备已连接
adb -host devices

set p="%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%_log"
set m="%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%_IC_log"
set n="%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%_IVI_log"
set d="%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%_dmesg_log"
mkdir %p%
echo.
adb -host shell "logctl -p 2"
echo.
echo 正在抓取IC log
echo step 1:ctrl+C 停止IC log抓取
echo step 2:然后选择N导出log
adb -host shell dmesg> .\%p%\%d%.txt &
adb -host shell logctl -v threadtime > .\%p%\%m%.txt &

adb -host shell "adb_ivi shell 'logctl -p 2'" &
echo.
echo log抓取已结束，请查看
explorer ".\%p%"
pause