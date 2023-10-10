local maps = require("chai.mappings").flash

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  opts = {},
  keys = maps.keys,
}
