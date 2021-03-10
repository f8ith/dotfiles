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
use {
  'neovim/nvim-lspconfig',
  config = function()
  require'lspconfig'.pyright.setup{}
  require'lspconfig'.gopls.setup{}
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.vuels.setup{}
  require'lspconfig'.jsonls.setup{}
  require'lspconfig'.cssls.setup{}
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require'lspconfig'.html.setup {
    capabilities = capabilities,
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
use 'samoshkin/vim-mergetool'
use 'sedm0784/vim-you-autocorrect'
use 'tpope/vim-unimpaired'
use 'mattn/emmet-vim'
use 'liuchengxu/vista.vim'

-- file manager
use 'kyazdani42/nvim-tree.lua'

-- motions
use 'unblevable/quick-scope'
use 'tomtom/tcomment_vim'
use 'svermeulen/vim-cutlass'
-- use 'svermeulen/vim-yoink'
use 'svermeulen/vim-subversive'
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
