local Utils = require("utils")
local M = {}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

----- Plugins keymaps_table

M.flash = {
  {
    "s",
    mode = { "n", "x", "o" },
    function()
      require("flash").jump()
    end,
    desc = "[S]earch",
  },
  {
    "S",
    mode = { "o", "x" },
    function()
      require("flash").treesitter_search()
    end,
    desc = "[S]earch Treesitter",
  },
  {
    "H",
    mode = { "n", "o", "x" },
    function()
      require("flash").treesitter()
    end,
    desc = "Treesitter [H]ighlight",
  },
}

M.telescope = {
  { mode = { "n" }, "<leader>,", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
  { mode = { "n" }, "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Commands History" },

  -- find
  {
    mode = { "n", "v" },
    "<leader>fg",
    Utils.telescope("grep_string", { word_match = "-w" }),
    desc = "[F]ind [G]rep (root)",
  },
  {
    mode = { "n", "v" },
    "<leader>fG",
    Utils.telescope("grep_string", { cwd = false, word_match = "-w" }),
    desc = "[F]ind [G]rep (cwd)",
  },
  { mode = { "n" }, "<leader>ff", Utils.telescope("files"), desc = "[F]ind [F]iles (root)" },
  { mode = { "n" }, "<leader>fF", Utils.telescope("files"), desc = "[F]ind [F]iles (cwd)" },
  { mode = { "n" }, "<leader>fw", Utils.telescope("live_grep"), desc = "[F]ind [W]ords (root)" },
  { mode = { "n" }, "<leader>fW", Utils.telescope("live_grep"), desc = "[F]ind [W]ords (cwd)" },
  {
    mode = { "n" },
    "<leader>fs",
    Utils.telescope("lsp_document_symbols", {
      symbols = {
        "Class",
        "Function",
        "Method",
        "Constructor",
        "Interface",
        "Module",
        "Struct",
        "Trait",
        "Field",
        "Property",
      },
    }),
    desc = "[F]ind [S]ymbol",
  },

  -- git related
  { mode = { "n" }, "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "[G]it [S]tatus" },
}

--- idk wtf are all these but copied from lazyvim distro for now
M.telescope_opts = {
  i = {
    ["<c-t>"] = function(...)
      return require("trouble.providers.telescope").open_with_trouble(...)
    end,
    ["<a-t>"] = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end,
    ["<a-i>"] = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      Utils.telescope("find_files", { no_ignore = true, default_text = line })()
    end,
    ["<a-h>"] = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      Utils.telescope("find_files", { hidden = true, default_text = line })()
    end,
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
  },
}

M.neoTree = {
  { mode = { "n" }, "<C-e>", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  {
    mode = { "n" },
    "<leader>e",
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd("p")
      else
        vim.cmd.Neotree("focus")
      end
    end,
    desc = "Toggle Explorer Focus",
  },
}

return M
