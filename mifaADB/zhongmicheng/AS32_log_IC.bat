@echo off
adb -host kill-server
echo �豸��������...
adb -host wait-for-devices
cls
echo �豸������
adb -host devices

set p="%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%_log"
set m="%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%_IC_log"
set n="%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%_IVI_log"
set d="%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%_dmesg_log"
mkdir %p%
echo.
adb -host shell "logctl -p 2"
echo.
echo ����ץȡIC log
echo step 1:ctrl+C ֹͣIC logץȡ
echo step 2:Ȼ��ѡ��N����log
adb -host shell dmesg> .\%p%\%d%.txt &
adb -host shell logctl -v threadtime > .\%p%\%m%.txt &

adb -host shell "adb_ivi shell 'logctl -p 2'" &
echo.
echo logץȡ�ѽ�������鿴
explorer ".\%p%"
pause