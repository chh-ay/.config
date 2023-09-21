local Utils = require("lazyvim.util")
local M = {}

M.neoTree = {
  { mode = { "n" }, "<C-e>", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
  {
    mode = { "n" },
    "<leader>e",
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd("p")
      else
        vim.cmd.Neotree("focus")
      end
    end,
    desc = "Toggle Explorer Focus",
  },
}

M.spectre = {
  {
    mode = { "n", "v" },
    "<leader>sr",
    "<cmd>lua require('spectre').toggle()<CR>",
    desc = "[S]earch/[R]eplace (CWD)",
  },
  {
    mode = { "n" },
    "<leader>scf",
    "<cmd>lua require('spectre').open_file_search()<CR>",
    desc = "[S]earch/Replace ([C]urrent [F]ile)",
  },
}

M.telescope = {
  -- utils
  { mode = { "n" }, "<leader>,", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
  { mode = { "n" }, "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Commands History" },
  {
    mode = { "n" },
    "<leader>cs",
    Utils.telescope("colorscheme", { enable_preview = true }),
    desc = "[C]olor[s]cheme preview",
  },

  -- find
  { mode = { "n", "v" }, "<leader>fw", Utils.telescope("grep_string", { word_match = "-w" }), desc = "[F]ind [W]ords" },
  { mode = { "n" }, "<leader>ff", Utils.telescope("files"), desc = "[F]ind [F]iles" },
  { mode = { "n" }, "<leader>fg", Utils.telescope("live_grep"), desc = "[F]ind [G]rep" },
  {
    mode = { "n" },
    "<leader>fs",
    Utils.telescope("lsp_document_symbols", {
      symbols = {
        "Class",
        "Function",
        "Method",
        "Constructor",
        "Interface",
        "Module",
        "Struct",
        "Trait",
        "Field",
        "Property",
      },
    }),
    desc = "[F]ind [S]ymbol",
  },

  -- git related
  { mode = { "n" }, "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "[G]it [S]tatus" },
}

M.harpoon = {
  { mode = "n", "<leader>a", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Harpoon" },
  { mode = "n", "<leader>af", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harppon [A]dd [F]ile" },
  { mode = "n", "<S-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon Navigate File (1)" },
  { mode = "n", "<S-j>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon Navigate File (2)" },
  { mode = "n", "<S-k>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon Navigate File (3)" },
  { mode = "n", "<S-l>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon Navigate File (4)" },
  { mode = "n", "<S-n>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Harpoon Navigate Next" },
  { mode = "n", "<S-p>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Harpoon Navigate Previous" },
}

return M
