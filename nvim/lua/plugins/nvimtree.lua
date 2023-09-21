local map = require("plugins.keymap.mappings")
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return map.neoTree
    end,
  },
}
