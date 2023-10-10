local maps = require("chai.mappings").mini
return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.comment").setup {
      mappings = {
        comment = "gc",
        comment_line = "gcc",
        textobject = "gc",
      },
    }

    require("mini.indentscope").setup {
      symbol = "│",
      options = {
        try_as_border = true,
      },
    }

    require("mini.surround").setup {
      search_method = "cover_or_nearest",
      mappings = {
        add = "msa",
        delete = "msd",
        find = "msf", -- (To the right side)
        find_left = "",
        highlight = "msh",
        replace = "msr",
        update_n_lines = "",

        -- Add this only if you don't want to use extended mappings
        suffix_last = "",
        suffix_next = "",
      },
    }

    require("mini.bufremove").setup {}
    require("mini.pairs").setup {}
  end,
}
