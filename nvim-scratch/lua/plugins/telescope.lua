local map = require("utils.keymaps")

local M = {
  "nvim-telescope/telescope.nvim",
  event = "BufReadPre",
  cmd = "Telescope",
  dependencies = { { "nvim-telescope/telescope-fzy-native.nvim", build = "make" } },
  keys = map.telescope,
  opts = {
    defaults = {
      prompt_prefix = "  ",
      selection_caret = " ",
      mappings = map.telescope_opts,
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}

return M
