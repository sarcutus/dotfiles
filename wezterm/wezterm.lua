local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'JetBrains Mono'
config.color_scheme = 'Batman'

config.enable_wayland = true

config.enable_scroll_bar = true

return {
    unix_domains = { {
        name = 'unix'
    } },
    
    default_gui_startup_args = { 'connect', 'unix' }
}
