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

use {'neoclide/coc.nvim', branch = 'release'}

-- built in lsp
-- use 'nvim-lua/lsp-status.nvim'
-- use {
--   'neovim/nvim-lspconfig',
--   config = function()
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {
--       'documentation',
--       'detail',
--       'additionalTextEdits',
--     }
--   }
--
--   local lsp_status = require("lsp-status")
--   local nvim_lsp = require "lspconfig"
--   local servers = {
--       "html",
--       "cssls",
--       "jsonls",
--       "vuels",
--       "bashls",
--       "tsserver",
--       "pyright",
--       "gopls"
--   }
--
--   for _, lsp in ipairs(servers) do
--       nvim_lsp[lsp].setup {
--           capabilities = lsp_status.capabilities,
--           handlers = {
--             ["textDocument/publishDiagnostics"] = vim.lsp.with(
--               vim.lsp.diagnostic.on_publish_diagnostics, {
--                 virtual_text = false
--               }
--             ),
--           }
--       }
--   end
--
--   vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
--       if err ~= nil or result == nil then
--           return
--       end
--       if not vim.api.nvim_buf_get_option(bufnr, "modified") then
--           local view = vim.fn.winsaveview()
--           vim.lsp.util.apply_text_edits(result, bufnr)
--           vim.fn.winrestview(view)
--           if bufnr == vim.api.nvim_get_current_buf() then
--               vim.api.nvim_command("noautocmd :update")
--           end
--       end
--   end
--
--   local on_attach = function(client)
--       if client.resolved_capabilities.document_formatting then
--           vim.api.nvim_command [[augroup Format]]
--           vim.api.nvim_command [[autocmd! * <buffer>]]
--           vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
--           vim.api.nvim_command [[augroup END]]
--       end
--   end
--
--   -- Setup diagnostics formaters and linters for non LSP provided files
--   nvim_lsp.efm.setup {
--       on_attach = on_attach,
--       capabilities = lsp_status.capabilities,
--       init_options = {
--           documentFormatting = true,
--           codeAction = true
--       },
--       filetypes = {
--         'javascript',
--         "lua",
--         "sh",
--         "markdown",
--         "json",
--         "yaml",
--         "toml",
--         "python"
--
--       }
--   }
--
-- end
-- }
--
-- use {
--   'glepnir/lspsaga.nvim',
--   config = function()
--   local saga = require 'lspsaga'
--   saga.init_lsp_saga()
--   end
-- }
--use {'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins'}
--use 'Shougo/deoplete-lsp'
use {
  'hrsh7th/nvim-compe',
  config = function()
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = true;
    };
  }
  end
}


-- color schemes
-- use 'arcticicestudio/nord-vim'
-- use 'NLKNguyen/papercolor-theme'
-- use 'ajh17/spacegray.vim'
-- use 'fxn/vim-monochrome'
-- use 'cocopon/iceberg.vim'
use 'drewtempelmeyer/palenight.vim'
use 'Luxed/ayu-vim'
use 'b4skyx/serenade'
use { "catppuccin/nvim", as = "catppuccin" }
-- use 'connorholyday/vim-snazzy'
use 'navarasu/onedark.nvim'
use 'morhetz/gruvbox'

-- auto pairs
use 'alvan/vim-closetag'
-- use 'Raimondi/delimitMate'
use 'cohama/lexima.vim'

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

-- file manager
use {
  'kyazdani42/nvim-tree.lua',
  config = function()
  require("nvim-tree").setup()
end
}


-- motions
use 'unblevable/quick-scope'
use 'tpope/vim-surround'
use 'easymotion/vim-easymotion'

-- eyecandy
use 'sheerun/vim-polyglot'
use 'kyazdani42/nvim-web-devicons'
use 'norcalli/nvim-colorizer.lua'
use 'Yggdroot/indentLine'
use {
  'akinsho/nvim-bufferline.lua',
  config = function()
    --[[ ayu dark
    local bg = "#0a0e1a"
    local bg2 = "#1b2733"
    local bg3 = "#304357"
    local fg = "#b3b1ad"
    local accent = "#e6b450"
    local accent2 = "#00010a"
    local accent3 = "#e6b673" ]]

    --[[ ayu light
    local bg = "#fafafa"
    local bg2 = "#e7e8e9"
    local bg3 = "#e1e1e2"
    local fg = "#5c6773"
    local accent = "#ff9940"
    local accent2 = "#ff3333"
    local accent3 = "#ffc94a"
    ]]

    --[[ onedark?
    local bg = '#21252b'
    local bg2 = '#282c34'
    local bg3 = '#3e4452'
    local fg = '#abb2bf'
    local accent = '#FF8800'
    local accent2 = '#ec5f67'
    local accent3 = '#fabd2f'
    ]]


    require'bufferline'.setup{
        options = {
          numbers = "none",
          mappings = true,
          indicator = '▎',
          buffer_close_icon = '',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          tab_size = 18,
          show_buffer_icons = true, -- disable filetype icons for buffers
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
          -- can also be a table containing 2 custom separators
          -- [focused and unfocused]. eg: { '|', '|' }
          separator_style = "thin",
          enforce_regular_tabs = true,
          always_show_bufferline = true,
          sort_by = 'directory',
          offsets = {{filetype = "NvimTree", highlight = "Directory", text_align = "left"}},
        },
--         highlights = {
--             fill = {
--                 bg = bg
--              },
--             background = {
--                 bg = bg
--             },
--
--             -- buffer
--             buffer_selected = {
--                 fg = fg,
--                 bg = bg2,
--                 underline = true,
--                 undercurl = false,
--                 bold = true
--             },
--             separator = {
--                 fg = bg3,
--                 bg = bg
--             },
--             separator_selected = {
--                 fg = bg3,
--                 bg = bg2
--             },
--             separator_visible = {
--                 fg = bg2,
--                 bg = bg2
--             },
--             indicator_selected = {
--                 fg = accent,
--                 bg = bg2
--             },
--
--             -- tabs over right
--             tab = {
--                 fg = fg,
--                 bg = bg
--             },
--              tab_selected = {
--                 fg = accent,
--                 bg = bg2
--             },
--              tab_close = {
--                 fg = accent,
--                 bg = bg2
--             },
--             modified_selected = {
--                 fg = accent2,
--                 bg = bg2
--             },
--             modified = {
--                 fg = accent3,
--                 bg = bg
--             },
--             modified_visible = {
--                 fg = accent,
--                 bg = bg
--             }
--         }
    }
  end
  }
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

use {
  'camspiers/snap',
  config = function()
  local snap = require'snap'
  snap.register.map({"n"}, {"<C-p>"}, function()
    snap.run {
      producer = snap.get'consumer.fzf'(snap.get'producer.ripgrep.file'),
      select = snap.get'select.file'.select,
      multiselect = snap.get'select.file'.multiselect,
      views = {snap.get'preview.file'}
    }
  end)
  snap.register.map({"n"}, {"<Leader>p"}, function ()
    snap.run {
      producer = snap.get'producer.ripgrep.vimgrep',
      select = snap.get'select.vimgrep'.select,
      multiselect = snap.get'select.vimgrep'.multiselect,
      views = {snap.get'preview.vimgrep'}
    }
  end)
end}
end)
