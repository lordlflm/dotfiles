#!/bin/bash

MODE_FILE="$HOME/.light_mode"

if [ -f "$MODE_FILE" ]; then
  CURRENT_MODE=$(cat "$MODE_FILE")
else
  CURRENT_MODE="dark"
fi

if [ "$CURRENT_MODE" == "dark" ]; then
  NEW_MODE="light"
else
  NEW_MODE="dark"
fi

echo "$NEW_MODE" > "$MODE_FILE"

if [ $NEW_MODE == "light" ]; then
  kitty @ set-colors --all --configured ~/.config/kitty/themes/Kanagawa_light.conf
else
  kitty @ set-colors --all --configured ~/.config/kitty/themes/Kanagawa_dragon.conf
fi
