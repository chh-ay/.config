local map = require("plugins.keymap.mappings")
return {

  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      return map.telescope
    end,
  },
  {
    ---- Adding fzf extension
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
