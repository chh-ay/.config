-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  nmap("<leader>crn", vim.lsp.buf.rename, "[C]ode [R]e[n]ame")
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
  nmap("<leader>cd", vim.lsp.buf.type_definition, "[C]ode Type [D]efinition")

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", tag = "legacy", opts = { window = { blend = 0 } } },

      -- Additional lua configuration, makes nvim stuff amazing!
      { "folke/neodev.nvim", opts = {} },
    },

    config = function()
      require("neodev").setup()

      local servers = {
        gopls = {},
        rust_analyzer = {},
        tsserver = {
          keys = {
            "<leader>coi",
            function()
              vim.lsp.buf.code_action { apply = true, context = { only = { "source.organizeImports.ts" }, diagnostics = {} } }
            end,
            desc = "[C]ode [O]rganize [I]mport",
          },
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
        html = { filetypes = { "html", "twig", "hbs" } },

        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      }
      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require "mason-lspconfig"

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
          }
        end,
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "bash-language-server",
        "cspell",
        "css-lsp",
        "eslint_d",
        "graphql-language-service-cli",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "markdownlint",
        "prettierd",
        "rust-analyzer",
        "shfmt", -- bash/shell
        "tailwindcss-language-server",
        "taplo", -- toml
        "typescript-language-server",
        "yaml-language-server",
        "gopls",
        "editorconfig-checker",
        "prisma-language-server",
        "svelte-language-server",
        "sonarlint-language-server",
      },
    },

    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require "mason-registry"
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
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
