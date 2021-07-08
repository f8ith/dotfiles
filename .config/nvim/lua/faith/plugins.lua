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
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  local lsp_status = require("lsp-status")
  local nvim_lsp = require "lspconfig"
  local servers = {
      "html",
      "cssls",
      "jsonls",
      "vuels",
      "bashls",
      "tsserver",
      "pyright",
      "gopls"
  }

  for _, lsp in ipairs(servers) do
      nvim_lsp[lsp].setup {
          capabilities = lsp_status.capabilities,
          handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(
              vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false
              }
            ),
          }
      }
  end

  vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
      if err ~= nil or result == nil then
          return
      end
      if not vim.api.nvim_buf_get_option(bufnr, "modified") then
          local view = vim.fn.winsaveview()
          vim.lsp.util.apply_text_edits(result, bufnr)
          vim.fn.winrestview(view)
          if bufnr == vim.api.nvim_get_current_buf() then
              vim.api.nvim_command("noautocmd :update")
          end
      end
  end

  local on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
          vim.api.nvim_command [[augroup Format]]
          vim.api.nvim_command [[autocmd! * <buffer>]]
          vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
          vim.api.nvim_command [[augroup END]]
      end
  end

  -- Setup diagnostics formaters and linters for non LSP provided files
  nvim_lsp.efm.setup {
      on_attach = on_attach,
      capabilities = lsp_status.capabilities,
      init_options = {
          documentFormatting = true,
          codeAction = true
      },
      filetypes = {
        'javascript',
        "lua",
        "sh",
        "markdown",
        "json",
        "yaml",
        "toml",
        "python"

      }
  }

  --[[ nvim_lsp.diagnosticls.setup {
      on_attach = on_attach,
      capabilities = lsp_status.capabilities,
      cmd = {"diagnostic-languageserver", "--stdio"},
      filetypes = {
          "lua",
          "sh",
          "markdown",
          "json",
          "yaml",
          "toml",
          "python"
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
              },
              eslint = {
                sourceName = "eslint",
                command = "eslint_d",
                rootPatterns = {".eslintrc.js", "package.json"},
                debounce = 100,
                args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${ruleId}]",
                    security = "severity"
                },
                securities = {[2] = "error", [1] = "warning"}
              }
          },
          filetypes = {
            sh = "shellcheck",
            markdown = "markdownlint",
            javascript = "eslint",
            vue = "eslint"
          },
          formatters = {
            shfmt = {
                command = "shfmt",
                args = {"-i", "2", "-bn", "-ci", "-sr"}
            },
            prettier = {
                command = "prettier",
                args = {"--stdin-filepath", "%filepath"},
            },
            black = {
                command = "black",
                args = {"%filepath"},
            }
          },
        formatFiletypes = {
            sh = "shfmt",
            json = "prettier",
            yaml = "prettier",
            toml = "prettier",
            markdown = "prettier",
            lua = "prettier",
            python = "black"
        }
    }
  }
  ]]
end
}

use {
  'glepnir/lspsaga.nvim',
  config = function()
  local saga = require 'lspsaga'
  saga.init_lsp_saga()
  end
}
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
use {
  'akinsho/nvim-bufferline.lua',
  config = function()
<<<<<<< HEAD
    --[[ ayu dark
    local bg = "#0a0e1a"
    local bg2 = "#1b2733"
    local bg3 = "#304357"
    local fg = "#b3b1ad"
    local accent = "#e6b450"
    local accent2 = "#00010a"
    local accent3 = "#e6b673" ]]

=======
    --[[ ayu light
>>>>>>> refs/remotes/origin/master
    local bg = "#fafafa"
    local bg2 = "#e7e8e9"
    local bg3 = "#e1e1e2"
    local fg = "#5c6773"
    local accent = "#ff9940"
    local accent2 = "#ff3333"
    local accent3 = "#ffc94a"
    ]]
    local bg = "#292d3e"
    local bg2 = "#3e4251"
    local bg3 = "#3E4452"
    local fg = "#cccccc"
    local accent = "#F78C6C"
    local accent2 = "#ff5370"
    local accent3 = "#ffcb6b"
    require'bufferline'.setup{
        options = {
          numbers = "none",
          mappings = true,
          -- NOTE: this plugin is designed with this icon in mind,
          -- and so changing this is NOT recommended, this is intended
          -- as an escape hatch for people who cannot bear it for whatever reason
          indicator_icon = '▎',
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
        highlights = {
             fill = {
                 guibg = bg
             },
            background = {
                guibg = bg
            },

            -- buffer
            buffer_selected = {
                guifg = fg,
                guibg = bg2,
                gui = "bold"
            },
            separator = {
                guifg = bg3,
                guibg = bg
            },
            separator_selected = {
                guifg = bg3,
                guibg = bg2
            },
            separator_visible = {
                guifg = bg2,
                guibg = bg2
            },
            indicator_selected = {
                guifg = accent,
                guibg = bg2
            },

            -- tabs over right
            tab = {
                guifg = fg,
                guibg = bg
            },
             tab_selected = {
                guifg = accent,
                guibg = bg2
            },
             tab_close = {
                guifg = accent,
                guibg = bg2
            },
            modified_selected = {
                guifg = accent2,
                guibg = bg2
            },
            modified = {
                guifg = accent3,
                guibg = bg
            },
            modified_visible = {
                guifg = accent,
                guibg = bg
            }
        }
        --[[ highlights = {
            fill = {
                guifg = '#fafafa',
                guibg = '#e7e8e9'
            },
            tab = {
                guifg = '#e7e8e9',
                guibg = '#fafafa'
            },
            tab_close = {
                guifg = '#ff9940',
                guibg = '#e7e8e9'
            },
            indicator_selected = {
                guifg = '#fafafa',
                guibg = '#fafafa'
            },
        } ]]
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
