vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.fileencoding = "utf-8"
opt.guifont = "monospace:h12"
opt.signcolumn = "yes:1"
opt.mouse = "a"
opt.autowrite = true -- Enable auto write
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.termguicolors = true
opt.hidden = true
opt.magic = true
opt.list = true -- Show some invisible characters (tabs...
opt.conceallevel = 0
opt.hlsearch = true
opt.pumblend = 12
opt.pumheight = 12
opt.showmode = false
opt.showtabline = 0
opt.wrap = false
opt.number = true
opt.relativenumber = true -- Relative line numbers
opt.laststatus = 3
opt.spelllang = { "en" }
opt.winminwidth = 5 -- Minimum window width
opt.wildmode = "longest:full,full" -- Command-line completion mode

opt.formatoptions = "jcroqlnt" -- tcqj
opt.inccommand = "nosplit" -- preview incremental substitute

opt.ignorecase = true
opt.smartcase = true
opt.infercase = true

opt.undofile = true
opt.undolevels = 10000
opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.shiftwidth = 2
opt.tabstop = 2

opt.splitkeep = "screen"
opt.splitbelow = true
opt.splitright = true

opt.timeoutlen = 1000
opt.updatetime = 200

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.linebreak = true
opt.whichwrap = "h,l,<,>,[,],~"
opt.breakindentopt = "shift:2,min:20"
vim.wo.showbreak = "NONE"

opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,]")
vim.cmd([[set fillchars-=vert:\| | set fillchars+=vert:\ ]])
vim.cmd([[set fillchars+=eob:\ ]])

opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
opt.grepprg = "rg --vimgrep --no-heading --smart-case"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
