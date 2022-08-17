adb -host -d remount
adb -host -d logctl -R
adb -host -d logctl -C block -o level:2,3,4,5,6,7
echo ctrl+C to stop
adb -host -d logctl > logic.txt
