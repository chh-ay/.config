return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "prisma-language-server",
        "svelte-language-server",
        "sonarlint-language-server",
        "cspell",
      })
    end,
  },
}
