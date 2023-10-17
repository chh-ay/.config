-- Modes
--  Modes
--   normal_mode = "n",
--    normal_mode = "n",
--   insert_mode = "i",
--    insert_mode = "i",
--   visual_mode = "v",
--    visual_mode = "v",
--   visual_block_mode = "x",
--    visual_block_mode = "x",
--   term_mode = "t",
--    term_mode = "t",
--   command_mode = "c",
--    command_mode = "c",
--
--  Keys
--    C - Control
--    M - Meta/Command/Alt
--    S - Shifts

local Utils = require "lazyvim.util"
local M = {}

M.NeoTree = {
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

M.Telescope = {
  -- utils
  { mode = { "n" }, "<leader>,", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
  { mode = { "n" }, "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Commands History" },

  -- find
  { mode = { "n", "v" }, "<leader>fg", Utils.telescope("grep_string", { word_match = "-w" }), desc = "[F]ind [W]ords" },
  { mode = { "n" }, "<leader>ff", Utils.telescope "files", desc = "[F]ind [F]iles" },
  { mode = { "n" }, "<leader>fw", Utils.telescope "live_grep", desc = "[F]ind [G]rep" },
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

return M
