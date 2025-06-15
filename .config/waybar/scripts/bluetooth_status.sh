#!/bin/bash

power=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
device=$(bluetoothctl info | grep "Name:" | awk '{print $2}')

if [[ "$power" == "yes" ]]; then
    if [[ -n "$device" ]]; then
        echo " $device"
    else
        echo " On"
    fi
else
    echo "Off"
fi

