#!/bin/bash

AC_STATE=$(cat /sys/class/power_supply/AC/online)

if [ "$AC_STATE" -eq 1 ]; then
    /usr/bin/bluetoothctl mgmt.fast-conn on
else
    /usr/bin/bluetoothctl mgmt.fast-conn off
fi
