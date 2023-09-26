local M = {
  "catppuccin/nvim", name = "catppuccin", priority = 1000,
  config = function()
    local colors_status_ok, colors = pcall(require, "catppuccin")
    if not colors_status_ok then
      return
    end

    colors.setup {
      flavour = "mocha",
      transparent_background = true
    }

  end,
}

return M
