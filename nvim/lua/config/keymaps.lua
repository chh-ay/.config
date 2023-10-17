-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
--    S - Shift

local Utils = require "lazyvim.util"

local keymap = vim.keymap.set
local remove = vim.keymap.del

--------------------- Tmux Navigation ------------------------
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window left" })
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window Right" })
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window down" })
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window Up" })

remove("n", "<S-h>")
remove("n", "<S-l>")
remove("n", "<leader>gg")
remove("n", "<leader>gG")
remove("n", "<leader>l")
remove("n", "<leader>L")
remove("n", "<leader>K")
remove("n", "]b")
remove("n", "[b")

keymap("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "[L]azy" })
keymap("n", "<leader>lg", function()
  Utils.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "[L]azy [G]it" })
