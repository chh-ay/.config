local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = true,
    integrations = {
      -- alpha = true,
      cmp = true,
      flash = true,
      -- gitsigns = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      lsp_trouble = true,
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      -- navic = { enabled = true, custom_bg = "lualine" },
      -- neotest = true,
      -- noice = true,
      -- notify = true,
      -- neotree = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      -- which_key = true,
    },
  },
  config = function(_, opts)
    local status_ok, catppuccin = pcall(require, "catppuccin")
    if not status_ok then
      return
    end

    catppuccin.setup(opts)
  end,
}

return M
