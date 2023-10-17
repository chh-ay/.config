local keymaps = require "utils.keymaps"

return {
  {
    "nvim-telescope/telescope.nvim",
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
