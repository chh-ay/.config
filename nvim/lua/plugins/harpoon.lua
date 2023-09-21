local map = require("plugins.keymap.mappings")
return {
  {
    "ThePrimeagen/harpoon",
    keys = function()
      return map.harpoon
    end,
  },
}
