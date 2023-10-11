local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { flavour = "mocha", transparent_background = true },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end,
  },

  -- Lazygit (without floatterm)
  { "kdheepak/lazygit.nvim" },

  -- Nvim-Tmux seemless navigation
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- Misc
  { "nvim-tree/nvim-web-devicons" },
  { "nvim-lua/plenary.nvim" },
  { "MunifTanjim/nui.nvim" },

  -- LSP Configuration & Plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", tag = "legacy", opts = { window = { blend = 0 } } },
      "folke/neodev.nvim",
    },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",
      "rafamadriz/friendly-snippets",
    },
  },

  -- Auto format
  require "chai.plugins.format.autoformat",

  -- Custom plugins
  { import = "chai.plugins" },
  { import = "chai.plugins.lsp" },
}, {
  -- auto install missing colorscheme
  install = { colorscheme = { "catppuccin" }, missing = true },
  ui = {
    wrap = "true",
    border = "rounded",
  },
  -- check for plugins update
  checker = {
    enabled = true,
    -- every 12 hours
    frequency = 60 * 60 * 12,
  },
  -- check for changes in config file
  change_detection = {
    enabled = true,
  },
})

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require("mason").setup()
require("mason-lspconfig").setup()

-- Setup neovim lua configuration
require("neodev").setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require "mason-lspconfig"

local Utils = require "chai.utils"

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(Utils.servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = Utils.on_attach,
      settings = Utils.servers[server_name],
      filetypes = (Utils.servers[server_name] or {}).filetypes,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require "cmp"
local luasnip = require "luasnip"
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup {}

---@diagnostic disable-next-line: missing-fields
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete {},
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
  ---@diagnostic disable-next-line: missing-fields
  formatting = {
    format = function(_, item)
      local icons = require("chai.utils").icons.kinds
      if icons[item.kind] then
        item.kind = icons[item.kind] .. " " .. item.kind
      end
      return item
    end,
  },
}
