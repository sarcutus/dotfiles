#! /run/current-system/sw/bin/bash

exec swaync &
exec swayosd-server &
exec hyprlauncher
exec wezterm-mux-server &
exec waybar -c /home/sarcutusdotfiles/mango/config.jsonc &
# exec waybar & >/dev/null 2>&1 &
exec swaybg --image /home/sarcutus/Pictures/377b3bcc70b5d87e8ced1181299b6ba3.png & 
exec crystal-dock &
