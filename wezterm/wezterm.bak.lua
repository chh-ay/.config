local wezterm = require "wezterm";
local mux = wezterm.mux
local config = {}

---- System Sync For Colorscheme----
function scheme_for_appearance(appearance)
    if appearance:find "Dark" then
        return "Catppuccin Macchiato"
    else
        return "Catppuccin Latte"
    end
end

---- Fullscreen on Startup ----
--wezterm.on("gui-startup", function(cmd)
--    local tab, pane, window = mux.spawn_window(cmd or {})
--    window:gui_window():maximize()
--end)

---- Colorscheme ----
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

---- WSL 2 Default On Startup ----
config.default_domain = "WSL:Ubuntu-22.04"

return config