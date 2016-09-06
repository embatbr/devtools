#!/bin/bash

# Added to System > Preferences > Startup Applications

sleep 10


usb_mouse_id=$(xinput list | grep -i "logitech" | grep -i "pointer" | cut -f2 | cut -d "=" -f2)

if [ ! -z $usb_mouse_id ]; then
    my_dir=`dirname $0`
    ${HOME}/tools/system/touchpad_switcher.sh false &
fi