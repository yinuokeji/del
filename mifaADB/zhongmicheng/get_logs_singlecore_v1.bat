::for usb adb
set dirname=log_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
echo %dirname%
mkdir %dirname%

cd %dirname%
mkdir yuntool
mkdir coredump
mkdir tombstones
mkdir zebralog
mkdir logmanager

adb -host wait-for-device

adb -host shell "ps auxw > /private/ps.log" 
adb -host shell "getprop > /private/prop.log"
adb -host shell "weston-dumpsys > /private/weston-dumpsys.log"
adb -host shell "pagemgr dump > /private/pagemgr-dump.log"
adb -host shell "weston-screenshooter /private/d1.png"
adb -host shell "cat /sys/class/kgsl/kgsl-3d0/gpu_busy_percentage > /private/gpu_busy_percentage.log" 
adb -host shell "cat /sys/class/kgsl/kgsl-3d0/gpubusy > /private/gpubusy.log" 
adb -host shell "cat /proc/last_kmsg > /private/last_kmsg.log" 
adb -host shell "cat /sys/kernel/debug/raw_message/raw_message_dump > /private/raw_message_dump.log" 

adb -host pull /private/raw_message_dump.log .
adb -host pull /private/last_kmsg.log .
adb -host pull /private/gpubusy.log .
adb -host pull /private/gpu_busy_percentage.log .
adb -host pull /private/ps.log .
adb -host pull /private/prop.log .
adb -host pull /private/weston-dumpsys.log .
adb -host pull /private/pagemgr-dump.log .
adb -host pull /private/d1.png .
adb -host pull /private/yuntool yuntool
adb -host pull /private/tools/coredump coredump
adb -host pull /var/tools/tombstones tombstones
adb -host pull /private/tools/logmanager logmanager
adb -host pull /map/log/zebralog/ZebraMapLog.txt zebralog
adb -host pull /map/log/gbllog zebralog
adb -host shell "rm -rf /private/yuntool/*" 
adb -host shell "rm -rf /private/tools/logmanager/*"

cd ..

pause
