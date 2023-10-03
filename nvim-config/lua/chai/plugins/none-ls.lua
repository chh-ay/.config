return {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  opts = function()
    local none_ls = require "null-ls"
    local formatting = none_ls.builtins.formatting
    local diagnostics = none_ls.builtins.diagnostics
    local code_actions = none_ls.builtins.code_actions
    local completion = none_ls.builtins.completion
    return {
      debug = true,
      sources = {
        -- Formatting
        formatting.shfmt,
        formatting.prettierd,
        formatting.clang_format,
        formatting.taplo, -- toml file
        formatting.black, -- for python xd?? my favorite formatter "black"
        formatting.fish_indent,

        -- Diagnostics
        diagnostics.fish,
        diagnostics.trail_space,
        diagnostics.cspell.with {
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["WARN"]
          end,
        },
        diagnostics.editorconfig_checker,

        -- Code Actions
        code_actions.gitsigns,
        code_actions.cspell,
      },
    }
  end,
}
