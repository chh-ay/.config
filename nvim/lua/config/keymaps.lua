-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--  Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--
--  Keys
--    C - Control
--    M - Meta/Command/Alt
--    S - Shift

--- Really useful rebind, should try it out some days
-- setxkbmap -option "caps:escape,shift:both_capslock"

local keymap = vim.keymap.set
local remove = vim.keymap.del
--------------------- Tmux Navigation ------------------------
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window left" })
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window Right" })
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window down" })
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window Up" })
keymap("n", "<M-[>", "<esc>", { desc = "Hi insert mode" })

keymap("v", "D", '"_d', { desc = "Delete to blackhole register in visual mode" })
