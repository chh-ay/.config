local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  opts = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    return {
      debug = true,
      sources = {
        formatting.shfmt,
        formatting.prettierd,
        formatting.clang_format,
        formatting.taplo, -- toml file
        formatting.black, -- for python xd??
        formatting.fish_indent,
        diagnostics.fish,
        diagnostics.trail_space,
        diagnostics.cspell.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["WARN"]
          end,
        }),
        diagnostics.editorconfig_checker,
        code_actions.gitsigns,
        code_actions.cspell,
      },
    }
  end,
}

return M
