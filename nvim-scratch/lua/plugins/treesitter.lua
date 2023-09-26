-- Check if we are using vscode or vscodium
-- if we are then dont need treesitter/code highlighter
if vim.g.vscode or vim.g.vscodium then
  usage = false
else
  usage = true
end

local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  cmd = { "TSUpdateSync" },
  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "comment",
      "cpp",
      "css",
      "dockerfile",
      "fish",
      "go",
      "gomod",
      "graphql",
      "html",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "prisma",
      "python",
      "regex",
      "rust",
      "scss",
      "sql",
      "svelte",
      "toml",
      "tsx",
      "typescript",
      "yaml",
    },
    ignore_install = {}, -- List of parsers to ignore installation
    sync_install = false,
    autopairs = { enable = true },
    autotag = { enable = true },
    indent = { enable = true, disable = { "yaml", "c" } },
    highlight = {
      enable = usage, -- false will disable the whole plugins
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    rainbow = {
      enable = usage,
      extended_mode = true,
      max_file_lines = nil,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

return M
