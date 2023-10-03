local maps = require("chai.mappings").mini
return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    local mini_status_ok, mini = pcall(require, "mini")
    if not mini_status_ok then
      return
    end

    mini.bufremove.setup {
      keys = maps.bufremove,
    }

    mini.comment.setup {
      mappings = {
        comment = "gc",
        comment_line = "gcc",
        textobject = "gc",
      },
    }

    mini.surround.setup {
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

    mini.pairs.setup {}
  end,
}
