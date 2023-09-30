local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode or vim.g.vscodium then
end

require("lazy").setup({

  -- Nvim-Tmux seemless navigation
  { "christoomey/vim-tmux-navigator", lazy = false },
  { import = "chai.plugins" },
}, {
  -- auto install missing colorscheme
  install = { colorscheme = { "catppuccin" }, missing = true },
  ui = {
    wrap = "true",
    border = "rounded",
  },
  -- check for plugins update
  checker = {
    enabled = true,
    -- every 12 hours
    frequency = 60 * 60 * 12,
  },
  -- check for changes in config file
  change_detection = {
    enabled = true,
  },
})
