@echo off
adb -host kill-server
adb -host wait-for-device
adb -host devices
adb -host shell "echo "enable n;" > /proc/alog" 
adb -host shell "logctl -R" 
adb -host shell "logctl -C block -o level:2,3,4,5,6,7" 
adb -host shell "logctl -p 2" 
echo Press ctrl +c and select Y to stop
adb -host logctl -v threadtime >log.log





