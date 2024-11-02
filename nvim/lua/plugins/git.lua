return {
  "lewis6991/gitsigns.nvim",
  opts = function(_, opts)
    vim.list_extend(opts, {
      signs_staged_enable = true,
      current_line_blame = true,
    })
  end,
}
