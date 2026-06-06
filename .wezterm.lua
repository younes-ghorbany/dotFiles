-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
-- config.initial_cols = 120
-- config.initial_rows = 28

-- or, changing the font size and color scheme.
-- config.font = wezterm.font 'DankMono Nerd Font'
config.window_background_opacity = 0.88

config.font = wezterm.font_with_fallback {
  'DankMono Nerd Font',
  'IRANSansX',
}
config.font_size = 13.5
config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.bidi_enabled = true
config.bidi_direction = "LeftToRight"
config.window_close_confirmation = 'NeverPrompt'

-- Finally, return the configuration to wezterm:
return config
