local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()

-- misc
use 'wbthomason/packer.nvim'
use 'b3nj5m1n/kommentary'

-- built in lsp
use 'nvim-lua/lsp-status.nvim'
use {
  'neovim/nvim-lspconfig',
  config = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local lsp_status = require("lsp-status")
  local nvim_lsp = require "lspconfig"
  local servers = {
      "html",
      "cssls",
      "jsonls",
      "vuels",
      "bashls",
      "tsserver",
      "pyright"
  }

  for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
          capabilities = lsp_status.capabilities
      }
  end

  -- Setup diagnostics formaters and linters for non LSP provided files
  nvim_lsp.diagnosticls.setup {
      on_attach = on_attach,
      capabilities = lsp_status.capabilities,
      cmd = {"diagnostic-languageserver", "--stdio"},
      filetypes = {
          "lua",
          "sh",
          "markdown",
          "json",
          "yaml",
          "toml"
      },
      init_options = {
          linters = {
              shellcheck = {
                  command = "shellcheck",
                  debounce = 100,
                  args = {"--format", "json", "-"},
                  sourceName = "shellcheck",
                  parseJson = {
                      line = "line",
                      column = "column",
                      endLine = "endLine",
                      endColumn = "endColumn",
                      message = "${message} [${code}]",
                      security = "level"
                  },
                  securities = {
                      error = "error",
                      warning = "warning",
                      info = "info",
                      style = "hint"
                  }
              },
              markdownlint = {
                  command = "markdownlint",
                  isStderr = true,
                  debounce = 100,
                  args = {"--stdin"},
                  offsetLine = 0,
                  offsetColumn = 0,
                  sourceName = "markdownlint",
                  formatLines = 1,
                  formatPattern = {
                      "^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$",
                      {
                          line = 1,
                          column = 3,
                          message = {4}
                      }
                  }
              }
          },
          filetypes = {
              sh = "shellcheck",
              markdown = "markdownlint"
          },
    }
  }
  end
}

use {
  'glepnir/lspsaga.nvim',
  config = function()
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
  end
}
use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'}
use 'Shougo/deoplete-lsp'


-- color schemes
-- use 'arcticicestudio/nord-vim'
-- use 'NLKNguyen/papercolor-theme'
-- use 'ajh17/spacegray.vim'
-- use 'fxn/vim-monochrome'
-- use 'cocopon/iceberg.vim'
use 'ayu-theme/ayu-vim'
use 'b4skyx/serenade'
-- use 'connorholyday/vim-snazzy'
-- use 'joshdick/onedark.vim'
-- use 'morhetz/gruvbox'

-- auto pairs
use 'alvan/vim-closetag'
use 'Raimondi/delimitMate'

-- git
use 'tpope/vim-fugitive'
use 'lambdalisue/gina.vim'
use 'christoomey/vim-conflicted'

-- tools
use 'mbbill/undotree'
use 'sedm0784/vim-you-autocorrect'
use 'tpope/vim-unimpaired'
use 'mattn/emmet-vim'
use 'liuchengxu/vista.vim'
use 'dense-analysis/ale'

-- file manager
use 'kyazdani42/nvim-tree.lua'

-- motions
use 'unblevable/quick-scope'
use 'svermeulen/vim-cutlass'
-- use 'svermeulen/vim-yoink'
-- use 'svermeulen/vim-subversive'
use 'tpope/vim-surround'
use 'easymotion/vim-easymotion'

-- eyecandy
use 'sheerun/vim-polyglot'
use 'kyazdani42/nvim-web-devicons'
use {'rrethy/vim-hexokinase', run = 'make hexokinase'}
use 'Yggdroot/indentLine'
use {'akinsho/nvim-bufferline.lua', config = function() require'bufferline'.setup{} end}
use 'moll/vim-bbye'
use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

use {
  'glepnir/galaxyline.nvim', branch = 'main', config = function() require'faith.statusline-minimal' end,
  requires = {'kyazdani42/nvim-web-devicons'}
}

use {
  'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  config = function() require('gitsigns').setup() end
}

end)
