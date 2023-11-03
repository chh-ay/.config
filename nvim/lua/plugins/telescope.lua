local keymaps = require "utils.keymaps"

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
    keys = function()
      return keymaps.Telescope
    end,
  },
  {
    ---- Adding fzf extension
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension "fzf"
      end,
    },
  },
}
