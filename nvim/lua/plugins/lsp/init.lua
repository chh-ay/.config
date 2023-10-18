return {
  {
    ---@lsp-configs
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    ---@mason-configs
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
  {
    ---@none-ls-configs
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      local formatting = nls.builtins.formatting
      local diagnostics = nls.builtins.diagnostics
      local code_actions = nls.builtins.code_actions
      local completion = nls.builtins.completion

      vim.list_extend(opts.sources, {
        diagnostics.cspell.with {
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["W"] ---@
          end,
        },

        code_actions.cspell,
      })
    end,
  },
}
