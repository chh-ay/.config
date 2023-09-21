-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local remove = vim.keymap.del

--------------------- Tmux Navigation ------------------------
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window left" })
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window Right" })
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window down" })
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window Up" })

remove("n", "<S-h>")
remove("n", "<S-l>")
