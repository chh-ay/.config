return {
  {
    "echasnovski/mini.surround",
    opts = {
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
    },
  },
}
