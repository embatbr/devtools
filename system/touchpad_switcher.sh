#!/bin/bash


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
