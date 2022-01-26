local map = require("core.utils").map
require "custom.autocmds"

map("v", "<leader>.", ":Lspsaga range_code_action<CR>")
map("n", "gr", ":<C-U>Lspsaga rename<CR>")
map('n','<C-p>','<cmd>lua require("fine-cmdline").open()<CR>')
map('n', '<leader>p', '"0p')
map('v', '<leader>p', '"0p')

local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
  use 'nyngwang/NeoRoot.lua'
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
    'puremourning/vimspector',
    config = function()
      vim.g.vimspector_enable_mappings = 'HUMAN'
    end,
   }
end)
