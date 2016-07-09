#!/bin/bash

# This script is called in "/etc/udev/rules.d/touchpad_toggle.rules". File content:
#
# SUBSYSTEM=="input", KERNEL=="mouse[0-9]*", ACTION=="add", ENV{DISPLAY}=":0",
# ENV{XAUTHORITY}="/home/embat/.Xauthority", RUN+="/home/embat/programming/system/usb_mouse_trigger.sh 0"
#
# SUBSYSTEM=="input", KERNEL=="mouse[0-9]*", ACTION=="remove", ENV{DISPLAY}=":0",
# ENV{XAUTHORITY}="/home/embat/.Xauthority", RUN+="/home/embat/programming/system/usb_mouse_trigger.sh 1"
#


sleep 1

value=$1

/home/embat/programming/system/touchpad_switcher.sh $value &