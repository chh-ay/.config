local maps = require "chai.mappings"

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  opts = {},
  keys = maps.flash.key,
}
