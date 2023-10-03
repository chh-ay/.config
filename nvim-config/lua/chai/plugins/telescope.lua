local map = require "chai.mappings".telescope

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzy-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  keys = map.key,
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = map.opt,
    },
  },
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)

    pcall(telescope.load_extension, "fzf")
  end,
}
