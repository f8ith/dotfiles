-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"
local autocmds = require "custom.autocmds"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)
   map("n", "<leader>.", ":Lspsaga code_action<CR>", opt)
   map("v", "<leader>.", ":Lspsaga range_code_action<CR>", opt)
   map("n", "gr", ":<C-U>Lspsaga rename<CR>", opt)
   map('n','<C-p>','<cmd>lua require("fine-cmdline").open()<CR>', opt)
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
  use "williamboman/nvim-lsp-installer"
  use 'ggandor/lightspeed.nvim'
  use {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
       require("custom.plugins.null-ls").setup()
    end,
  }
  use {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  }
  use {
    'windwp/nvim-ts-autotag',
    after = "nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  }
  use {
    'tami5/lspsaga.nvim',
    branch = 'nvim51',
    config = function()
      require('lspsaga').init_lsp_saga()
    end,
  }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
