#! /run/current-system/sw/bin/bash

exec wezterm-mux-server >/dev/null 2>&1 &
exec waybar -c /home/sarcutusdotfiles/mango/config.jsonc >/dev/null 2>&1 &
exec hyprpaper & >/dev/null 2>&1 &
exec crystal-dock & >/dev/null 2>&1 &
