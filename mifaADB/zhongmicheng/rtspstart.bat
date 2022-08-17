adb -host shell 'kill `pidof page://com.yunos.syspersistentserver/syspersistentserver`'
adb -host shell sendlink page://com.yunos.syspersistentserver/syspersistentserver 1
adb -host shell dbus-send --system --type=method_call --print-reply --dest=com.ivi.rtspplay2 /com/ivi/rtspplay2 com.ivi.rtspplay2.play string:"rtsp://192.168.148.153:8554/OpusStream"
pause