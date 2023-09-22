local wezterm = require("wezterm")
local config = {}

if wezterm.target_triple == 'x86_64-pc-windows-mscv' then
	config.default_domain = "WSL:Ubuntu-22.04"
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	config.default_prog = { "/usr/bin/fish", "-l" }
	config.default_domain = "local"
elseif wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin" then
	config.default_prog = { "/usr/local/bin/fish", "-l" }
	config.default_domain = "local"
end

return {
	color_scheme = "Catppuccin Mocha",
	default_prog = config.default_prog,
	default_domain = config.default_domain,

	font_size = 12.0,
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
	line_height = 1.1,

	window_padding = {
		left = 10,
		right = 10,
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 0.45,
	window_decorations = "RESIZE",

	enable_tab_bar = false,
	enable_scroll_bar = false,
	check_for_updates = false,
	scrollback_lines = 5000,
}
