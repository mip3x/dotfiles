#!/bin/bash

current_date=$(date "+%d.%m.%Y")
current_time=$(date "+%H:%M:%S")
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_status=$(cat /sys/class/power_supply/BAT1/status)
current_language_start=$(swaymsg -t get_inputs | jq '.[0].xkb_active_layout_name')
current_language_end=`sed -e 's/^"//' -e 's/"$//' <<< "$current_language_start"` 

echo "$current_language_end :: $battery_charge $battery_status :: $current_date $current_time"
