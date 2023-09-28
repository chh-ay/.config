vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.completeopt = "menuone,noselect"
opt.fileencoding = "utf-8"
opt.signcolumn = "yes"
opt.confirm = true
opt.cursorline = true
opt.termguicolors = true
opt.list = true
opt.mouse = "a"
opt.hlsearch = true
opt.pumblend = 10
opt.pumheight = 10
opt.showtabline = 0
opt.wildmode = "longest:full,full" -- default is "full"

opt.number = true
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true
opt.infercase = true

opt.undolevels = 5000

opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.shiftwidth = 2
opt.tabstop = 2

opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.linebreak = true
opt.whichwrap = "h,l,<,>,[,],~"
opt.breakindentopt = "shift:2,min:20"
vim.wo.showbreak = "NONE"

opt.shortmess:append "c"
opt.whichwrap:append "<,>,[,]"

vim.cmd [[set fillchars-=vert:\| | set fillchars+=vert:\ ]]
vim.cmd [[set fillchars+=eob:\ ]]

opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
opt.grepprg = "rg --vimgrep --no-heading --smart-case"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
