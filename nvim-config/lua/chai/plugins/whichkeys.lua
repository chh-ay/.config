return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["ms"] = { name = "+mini.surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>b"] = { name = "+buffers" },
      ["<leader>f"] = { name = "+find" },
      ["<leader>l"] = { name = "+lazygit" },
      ["<leader>e"] = { name = "toggle Explorer" },
    },
  },
  config = function(_, opts)
    local wk = require "which-key"
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
