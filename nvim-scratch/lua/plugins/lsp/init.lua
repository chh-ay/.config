return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      {"hrsh7th/cmp-nvim-lsp"},
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
      },
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },
      -- add any global capabilities here
      capabilities = {},
      -- Automatically format on save
      autoformat = true,

      servers = {
        tsserver = {
          keys = {
            { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
            { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
          },
          settings = {
            typescript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            javascript = {
              format = {
                indentSize = vim.o.shiftwidth,
                convertTabsToSpaces = vim.o.expandtab,
                tabSize = vim.o.tabstop,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
    config = function(_, _)
      local utils = require("utils")
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      local lsp_utils = require("plugins.lsp.lsp-utils")
      lsp_utils.setup()

      mason_lspconfig.setup({
        ensure_installed = utils.lsp_servers,
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = lsp_utils.on_attach,
            capabilities = lsp_utils.capabilities,
          })
        end,
        ["pyright"] = function()
          lspconfig.pyright.setup({
            on_attach = lsp_utils.on_attach,
            capabilities = lsp_utils.capabilities,
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "off",
                },
              },
            },
          })
        end,
        ["clangd"] = function()
          local capabilities_cpp = lsp_utils.capabilities
          capabilities_cpp.offsetEncoding = { "uts-16" }
          lspconfig.clangd.setup({
            on_attach = lsp_utils.on_attach,
            capabilities = capabilities_cpp,
          })
        end,
        ["eslint"] = function()
          lspconfig.eslint.setup({
            -- for changing package manager right now is default
            -- settings = {
            --   packageManager = "pnpm"
            -- },
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end,
          })
        end,
      })
    end,
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        -- "flake8",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local utils = require("utils")
      local mr = require("mason-registry")
      local packages = utils.mason_packages
      local function ensure_installed()
        for _, package in ipairs(packages) do
          local p = mr.get_package(package)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
