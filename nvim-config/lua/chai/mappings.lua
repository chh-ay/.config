local M

M.flash = {
  {
    "s",
    mode = { "n", "x", "o" },
    function()
      require("flash").jump()
    end,
    desc = "[S]earch",
  },
  {
    "S",
    mode = { "o", "x" },
    function()
      require("flash").treesitter_search()
    end,
    desc = "[S]earch Treesitter",
  },
  {
    "H",
    mode = { "n", "o", "x" },
    function()
      require("flash").treesitter()
    end,
    desc = "Treesitter [H]ighlight",
  },
}

return M
