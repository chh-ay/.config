local Util = require("chai.utils").telescope
local M = {}

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
  { mode = { "n" }, "<leader>f?", Util "oldfiles", desc = "[F]ind [?]recent Open Files " },
  { mode = { "n" }, "<leader>,", Util "buffers", desc = "List Buffers" },
  { mode = { "n" }, "<leader>:", Util "command_history", desc = "Commands History" },

  -- find
  { mode = { "n" }, "<leader>ff", Util "find_files", desc = "[F]ind [F]iles" },
  { mode = { "n" }, "<leader>fg", Util "grep_string", desc = "[F]ind [G]rep" },
  { mode = { "n" }, "<leader>fw", Util "live_grep", desc = "[F]ind [W]ords" },
  {
    mode = { "n" },
    "<leader>fs",
    Util "lsp_document_symbols",
    {
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
    },
    desc = "[F]ind [S]ymbol",
  },

  -- git related
  { mode = { "n" }, "<leader>gs", Util "git_status", desc = "[G]it [S]tatus" },
}

M.neotree = {
  { mode = { "n" }, "<C-e>", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  {
    mode = { "n" },
    "<leader>e",
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
    desc = "Toggle Explorer Focus",
  },
}

return M
