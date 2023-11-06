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
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        layout_config = {
          horizontal = {
            width = 0.85,
            height = 0.85,
            preview_width = 0.55,
          },
        },
      },
    },
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
