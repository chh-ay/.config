local keymaps = require "utils.keymaps"

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = function()
    return keymaps.NeoTree
  end,
}
