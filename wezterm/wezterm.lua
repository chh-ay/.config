local wezterm = require("wezterm")
local default_prog

-- if wezterm.target_triple == 'x86_64-pc-windows-mscv' then

if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	default_prog = { "/usr/bin/fish", "-l" }
end

return {
	color_scheme = "Catppuccin Macchiato",
	default_prog = default_prog,

	font_size = 12.0,
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),

	window_padding = {
		left = 10,
		right = 10,
		top = 0,
		bottom = 0,
	},
	window_background_opacity = 0.25,
	window_decorations = "RESIZE",

	enable_tab_bar = false,
	enable_scroll_bar = false,
	check_for_updates = false,
	scrollback_lines = 5000,
}
