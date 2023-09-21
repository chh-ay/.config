return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        --- Web dev
        "html",
        "css",
        "prisma",
        "sql",
        "svelte",
        "javascript",
      })
    end,
  },
}
