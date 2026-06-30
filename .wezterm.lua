-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.window_background_opacity = 0.80

config.font = wezterm.font_with_fallback({
	{ family = "MapleMono NF", weight = "Light", italic = false },
	"DankMono Nerd Font",
	"IRANSansX",
})
config.font_size = 10.5
config.line_height = 1.2
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Tokyo Night Moon"
config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.bidi_enabled = true
config.bidi_direction = "LeftToRight"
config.window_close_confirmation = "NeverPrompt"

config.enable_wayland = false -- Only way to run wezterm in OMARCHY Linux

return config
