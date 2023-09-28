local wezterm = require "wezterm"
local config = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "/user/bin/fish", "-l" }
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
  colors = {
    indexed = { [16] = "#F8BD96", [17] = "#F5E0DC" },
    split = "#161320",
    visual_bell = "#302D41",
  },

  default_prog = config.default_prog,
  default_domain = config.default_domain,

  font_size = 12.0,
  font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", stretch = "Normal", style = "Normal" }),
  font_rules = {
    {
      italic = true,
      font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium", stretch = "Normal", style = "Italic" }),
    },
    {
      intensity = "Bold",
      font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Normal" }),
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", stretch = "Normal", style = "Italic" }),
    },
  },
  line_height = 1.05,

  window_padding = {
    left = 10,
    right = 10,
    top = 5,
    bottom = 0,
  },
  window_background_opacity = 0.92,
  window_decorations = "RESIZE",

  enable_tab_bar = false,
  enable_scroll_bar = false,
  check_for_updates = false,
  scrollback_lines = 5000,
}
