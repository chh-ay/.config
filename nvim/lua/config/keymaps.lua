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

local keymap = vim.keymap.set
local remove = vim.keymap.del

--------------------- Tmux Navigation ------------------------
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window left" })
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window Right" })
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window down" })
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window Up" })

-- Lazygit keybind
remove("n", "<leader>K")
remove("n", "<leader>gg")
remove("n", "<leader>gG")
remove("n", "<leader>gb")
remove("n", "<leader>gB")
remove("n", "<leader>gf")
remove("n", "<leader>gl")
remove("n", "<leader>gL")
--- Rebind
keymap("n", "<leader>lgg", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })
keymap("n", "<leader>lgG", function()
  LazyVim.lazygit()
end, { desc = "Lazygit (cwd)" })
keymap("n", "<leader>lgb", LazyVim.lazygit.blame_line, { desc = "Git Blame Line" })
keymap("n", "<leader>lgB", LazyVim.lazygit.browse, { desc = "Git Browse" })

-- LazyVim keybind
remove("n", "<leader>l")
remove("n", "<leader>L")
--- Rebind
keymap("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
keymap("n", "<leader>lL", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })
