adb -host -d remount
adb -host -d push bootlog_private.service /etc/systemd/system/
adb -host -d shell "echo -e 'bootlog_private.service'>>/usr/etc/service_uid_policy"
adb -host -d shell systemctl daemon-reload
adb -host -d shell systemctl enable bootlog_private.service
adb -host -d shell sync

adb -host forward tcp:9556 tcp:9556
adb -host connect 127.0.0.1:9556
adb -host -s 127.0.0.1:9556 remount
adb -host -s 127.0.0.1:9556 push bootlog_private.service /etc/systemd/system/
adb -host -s 127.0.0.1:9556 shell "echo -e 'bootlog_private.service' >> /usr/etc/service_uid_policy"
adb -host -s 127.0.0.1:9556 shell  systemctl daemon-reload
adb -host -s 127.0.0.1:9556 shell  systemctl enable bootlog_private.service
adb -host -s 127.0.0.1:9556 shell  sync
adb -host -s 127.0.0.1:9556 disconnect
pause

