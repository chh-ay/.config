local version = vim.version()

local header = [[
                ██╗  ██╗██╗  ██╗█████╗███╗  ██╗              Z
                ██║  ██║██║  ██║  ██║╝████╗ ██║          Z    
                ██║  ██║██║  ██║  ██║ ██╔██╗██║       z       
                ╚██╗██╔╝╚██╗██╔╝  ██║ ██║╚████║     z         
                 ╚████╝  ╚████╝ █████╗██║ ╚███║               
                  ╚══╝    ╚══╝  ╚═══╝╝╚═╝  ╚══╝               
]]

header = string.rep("\n", 4) .. header .. "\n\n"

-- stylua: ignore
local center = {
  { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = "  ", key = "f" },
  { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " 󰦛 ", key = "s" },
  { action = "ene | startinsert",                              desc = " New File",        icon = "  ", key = "n" },
  { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = "  ", key = "c" },
  { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = "  ", key = "q" },
}

for _, button in ipairs(center) do
  button.desc = button.desc .. string.rep(" ", 40 - #button.desc)
  button.key_format = "%s"
end

-- stylua: ignore
local shortcut = {
  { action = "lua LazyVim.pick()()",                           desc = "Find File ",       icon = "  ", key = "f" },
  { action = 'lua require("persistence").load()',              desc = "Restore Session ", icon = " 󰦛 ", key = "s" },
  { action = "ene | startinsert",                              desc = "New File ",        icon = "  ", key = "n" },
  { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = "Quit ",            icon = "  ", key = "q" },
}

local footer = {
  "",
  "nvim version " .. version.major .. "." .. version.minor,
}

return {
  "nvimdev/dashboard-nvim",
  opts = {
    theme = "hyper",
    config = {
      header = vim.split(header, "\n"),
      shortcut = shortcut,
      footer = footer,
      packages = { enable = false },
    },
  },
}
