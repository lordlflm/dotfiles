#!/usr/bin/env bash

# Find the first physical keyboard ID (not virtual, not libinput pointer)
keyboard_id=$(swaymsg -t get_inputs | jq -r '
  .[] | select(.type == "keyboard") | .identifier' | head -n1)

# If no keyboard found, exit
if [[ -z "$keyboard_id" ]]; then
  echo "No keyboard found"
  exit 1
fi

# Extract the layout names for that keyboard
layouts=$(swaymsg -t get_inputs | jq -r --arg id "$keyboard_id" '
  .[] | select(.identifier == $id) | .xkb_layout_names[]')

# Remove duplicates just in case
layouts=$(echo "$layouts" | awk '!seen[$0]++')

# Show menu and get selection
chosen=$(echo "$layouts" | wofi --dmenu -p "Select layout")

# If no selection, exit
if [[ -z "$chosen" ]]; then
  exit 0
fi

# Find index of the selected layout (0-based)
index=$(echo "$layouts" | grep -nF "$chosen" | cut -d: -f1 | awk '{print $1 - 1}')

# Validate index is a non-negative integer
if [[ ! "$index" =~ ^[0-9]+$ ]]; then
  echo "Invalid layout index: '$index'"
  exit 1
fi

# Apply the layout
swaymsg input "$keyboard_id" xkb_switch_layout "$index"

# Signal waybar to refresh
pkill -RTMIN+1 waybar

