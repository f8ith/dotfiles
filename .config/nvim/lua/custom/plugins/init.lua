return {
  { 'nyngwang/NeoRoot.lua' },
  { "williamboman/nvim-lsp-installer" },
  { 'ggandor/lightspeed.nvim' },
  { 
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
       require("custom.plugins.null-ls").setup()
    end,
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    requires = {
      {'MunifTanjim/nui.nvim'}
    }
  },
  { 
    'windwp/nvim-ts-autotag',
    after = "nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'puremourning/vimspector',
    config = function()
      vim.g.vimspector_enable_mappings = 'HUMAN'
    end,
  }
}
