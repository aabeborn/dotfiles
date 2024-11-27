-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.check_for_updates = true
config.term = "xterm-256color"


config.window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
}

config.color_scheme = 'Catppuccin Frappe'
config.window_background_opacity = 0.7
config.macos_window_background_blur = 30
config.font = wezterm.font 'GeistMono Nerd Font'
config.font_size = 12;
config.use_fancy_tab_bar = false;
config.enable_tab_bar = false;

-- and finally, return the configuration to wezterm
return config
