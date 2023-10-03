local maps = require "chai.mappings"
return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = maps.neotree,
  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  init = function()
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require "neo-tree"
      end
    end
  end,
  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      mappings = {
        ["<space>"] = "none",
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = " ",
        expander_expanded = " ",
        expander_highlight = "NeoTreeExpander",
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
  end,
}
