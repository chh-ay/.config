-- local map = require("utils.keymaps")
local Utils = require("utils")

local M = {
  "nvim-telescope/telescope.nvim",
  event = "BufReadPre",
  dependencies = {  "nvim-telescope/telescope-fzy-native.nvim", 
    build = "make"
  },
  keys =  { { mode = { "n" }, "<leader>,", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
  { mode = { "n" }, "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Commands History" },

  -- find
  -- {
  --   mode = { "n", "v" },
  --   "<leader>fg",
  --   Utils.telescope("grep_string", { word_match = "-w" }),
  --   desc = "[F]ind [G]rep (root)",
  -- },
  -- {
  --   mode = { "n", "v" },
  --   "<leader>fG",
  --   Utils.telescope("grep_string", { cwd = false, word_match = "-w" }),
  --   desc = "[F]ind [G]rep (cwd)",
  -- },
  -- { mode = { "n" }, "<leader>ff", Utils.telescope("files"), desc = "[F]ind [F]iles (root)" },
  -- { mode = { "n" }, "<leader>fF", Utils.telescope("files"), desc = "[F]ind [F]iles (cwd)" },
  -- { mode = { "n" }, "<leader>fw", Utils.telescope("live_grep"), desc = "[F]ind [W]ords (root)" },
  -- { mode = { "n" }, "<leader>fW", Utils.telescope("live_grep"), desc = "[F]ind [W]ords (cwd)" },
  -- {
  --   mode = { "n" },
  --   "<leader>fs",
  --   Utils.telescope("lsp_document_symbols", {
  --     symbols = {
  --       "Class",
  --       "Function",
  --       "Method",
  --       "Constructor",
  --       "Interface",
  --       "Module",
  --       "Struct",
  --       "Trait",
  --       "Field",
  --       "Property",
  --     },
  --   }),
  --   desc = "[F]ind [S]ymbol",
  -- },

  -- git related
  { mode = { "n" }, "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "[G]it [S]tatus" },},
  opts = {
    defaults = {
      prompt_prefix = "  ",
      selection_caret = " ",
      mappings =   {i = {
        ["<c-t>"] = function(...)
          return require("trouble.providers.telescope").open_with_trouble(...)
        end,
        ["<a-t>"] = function(...)
          return require("trouble.providers.telescope").open_selected_with_trouble(...)
        end,
        -- ["<a-i>"] = function()
        --   local action_state = require("telescope.actions.state")
        --   local line = action_state.get_current_line()
        --   Utils.telescope("find_files", { no_ignore = true, default_text = line })()
        -- end,
        -- ["<a-h>"] = function()
        --   local action_state = require("telescope.actions.state")
        --   local line = action_state.get_current_line()
        --   Utils.telescope("find_files", { hidden = true, default_text = line })()
        -- end,
        ["<C-Down>"] = function(...)
          return require("telescope.actions").cycle_history_next(...)
        end,
        ["<C-Up>"] = function(...)
          return require("telescope.actions").cycle_history_prev(...)
        end,
        ["<C-f>"] = function(...)
          return require("telescope.actions").preview_scrolling_down(...)
        end,
        ["<C-b>"] = function(...)
          return require("telescope.actions").preview_scrolling_up(...)
        end,
      },
      n = {
        ["q"] = function(...)
          return require("telescope.actions").close(...)
        end,
      },},
    },
    -- extensions = {
    --   fzf = {
    --     fuzzy = true, -- false will only do exact matching
    --     override_generic_sorter = true, -- override the generic sorter
    --     override_file_sorter = true, -- override the file sorter
    --     case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    --     -- the default case_mode is "smart_case"
    --   },
    -- },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
  end,
}

return M
