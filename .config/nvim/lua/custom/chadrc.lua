local map = require("core.utils").map
require "custom.autocmds"

map("v", "<leader>.", ":Lspsaga range_code_action<CR>")
map("n", "gr", ":<C-U>Lspsaga rename<CR>")
map('n','<C-p>','<cmd>lua require("fine-cmdline").open()<CR>')
map('n', '<leader>p', '"0p')
map('v', '<leader>p', '"0p')

local M = {}
M.options = {
  tabstop = 2
}

M.ui, M.mappings, M.plugins = {}, {}, {}

local userPlugins = require "custom.plugins"

M.ui = {
  theme = "tokyonight"
}

M.plugins = {
   install = userPlugins,
   options = {
      lspconfig = {
        setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   default_plugin_config_replace = {
    nvim_tree = {
      view = {
        allow_resize = false,
        side = "left",
        width = 25,
        hide_root_folder = false,
      }
    }
   },
}

return M
