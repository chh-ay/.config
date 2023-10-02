local Utils = require "chai.utils"
local map = require "chai.mappings"

local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzy-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  keys = map.telescope.key,
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = map.telescope.opt,
    },
  },
  config = function(_, opts)
    local telescope = require "telescope"
    telescope.setup(opts)

    pcall(telescope.load_extension, "fzf")
  end,
}

return M
