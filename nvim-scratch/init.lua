-- if vim.g.vscode or vim.g.vscodium then
-- require("utils.init")
-- require("core")
-- require("chai.lazy")
-- end
--
-- require("core")
-- require("chai")
-- require("lsp")

require("core.options")
require("core.lazy")

vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        require("core.autocmds")
        require("core.keymaps")
    end,
})
