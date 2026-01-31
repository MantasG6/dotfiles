#!/bin/bash
# Check if AC adapter is plugged in
if [[ $(cat /sys/class/power_supply/AC/online) -eq 1 ]]; then
    btmgmt -i hci0 fast-conn on
else
    btmgmt -i hci0 fast-conn off
fi
