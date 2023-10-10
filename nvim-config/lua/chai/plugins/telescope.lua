local map = require("chai.mappings")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = map.telescope.key
  opts = {
    defaults = {
      prompt_prefix = "  ",
      selection_caret = " ",
    },
  },
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)

    pcall(telescope.load_extension, "fzf")
  end,
}
