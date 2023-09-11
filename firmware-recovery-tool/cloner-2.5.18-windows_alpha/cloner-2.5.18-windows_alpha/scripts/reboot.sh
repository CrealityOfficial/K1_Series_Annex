#!/bin/sh

sync
echo 0 > /sys/class/android_usb/android0/enable
sleep 1
reboot -f