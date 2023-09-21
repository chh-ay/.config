local map = require("plugins.keymap.mappings")
return {
  {
    "nvim-pack/nvim-spectre",
    keys = function()
      return map.spectre
    end,
  },
}
