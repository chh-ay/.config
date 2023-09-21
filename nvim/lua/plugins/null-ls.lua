return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        -- Diagnostics
        nls.builtins.diagnostics.cspell,

        --  Code Actions
        nls.builtins.code_actions.cspell,
      })
    end,
  },
}
