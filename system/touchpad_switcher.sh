#!/bin/bash

# This script is called in "/etc/udev/rules.d/touchpad_toggle.rules".
# File content:
# SUBSYSTEM=="input", KERNEL=="mouse[0-9]*", ACTION=="add", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/embat/.Xauthority", RUN+="/home/embat/programming/system/touchpad_switcher.sh 0"
#
# SUBSYSTEM=="input", KERNEL=="mouse[0-9]*", ACTION=="remove", ENV{DISPLAY}=":0", ENV{XAUTHORITY}="/home/embat/.Xauthority", RUN+="/home/embat/programming/system/touchpad_switcher.sh 1"

# without it the script doesn't work
sleep 1

value=$1

declare -i touchpad_id
touchpad_id=$(xinput | grep -i "touchpad" | cut -f2 | cut -d "=" -f2);

if $value
then
    xinput enable $touchpad_id &
    notify-send -t 1000 "Touchpad enabled"
else
    xinput disable $touchpad_id &
    notify-send -t 1000 "Touchpad disabled"
fi

# # The line below works only for $value in [0, 1]
# xinput set-prop $touchpad_id "Device Enabled" $value
