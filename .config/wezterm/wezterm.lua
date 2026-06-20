local wezterm = require "wezterm"

local config = {}

config.enable_scroll_bar = true
config.min_scroll_bar_height = "2cell"
config.color_scheme = "Batman"

config.enable_wayland = true

front_end = "OpenGL"

-- config.background = {
-- 	source = {
--		File = "/home/sarcutus/Pictures/R.jpeg",
--	},
-- }

return {
    unix_domains = { {
        name = "unix"
    } },
    
    default_gui_startup_args = { "connect", "unix" }
}
