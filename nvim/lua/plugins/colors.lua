return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
