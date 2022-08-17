adb -host forward tcp:9556 tcp:9556
adb -host connect 127.0.0.1:9556
timeout /t 2
adb -host -s 127.0.0.1:9556 remount

adb -host -s 127.0.0.1:9556 logctl -R
adb -host -s 127.0.0.1:9556 logctl -C block -o level:2,3,4,5,6,7
echo ctrl+C to stop
adb -host -s 127.0.0.1:9556 logctl > logivi.txt

