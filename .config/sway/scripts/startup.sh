#!/bin/bash

swaymsg workspace "1:Code"
sleep 0.3
kitty --class nvim -e nvim &

sleep 0.5
swaymsg workspace "2:Term"
sleep 0.3
kitty &

sleep 0.5
swaymsg workspace "3:Browser"
sleep 0.3
firefox &



