local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
	execute 'packadd packer.nvim'
end

return require('packer').startup(function()
	-- misc
	use 'wbthomason/packer.nvim'
	use 'b3nj5m1n/kommentary'

	-- use { 'neoclide/coc.nvim', after = 'catppuccin', branch = 'release' }

	-- built in lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		},

	}

	use {
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { { "prettierd", "prettier" } },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	}

	-- use {
	-- 	'neovim/nvim-lspconfig',
	-- 	requires = {
	-- 		'nvim-lua/lsp-status.nvim'
	-- 	},
	-- 	config = function()
	-- 		local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- 		capabilities.textDocument.completion.completionItem.snippetSupport = true
	-- 		capabilities.textDocument.completion.completionItem.resolveSupport = {
	-- 			properties = {
	-- 				'documentation',
	-- 				'detail',
	-- 				'additionalTextEdits',
	-- 			}
	-- 		}

	-- 		local lsp_status = require("lsp-status")
	-- 		local nvim_lsp = require "lspconfig"
	-- 		local servers = {
	-- 			"html",
	-- 			"cssls",
	-- 			"jsonls",
	-- 			"vuels",
	-- 			"bashls",
	-- 			"ts_ls",
	-- 			"pyright",
	-- 			"gopls"
	-- 		}

	-- 		for _, lsp in ipairs(servers) do
	-- 			nvim_lsp[lsp].setup {
	-- 				capabilities = lsp_status.capabilities,
	-- 				handlers = {
	-- 					["textDocument/publishDiagnostics"] = vim.lsp.with(
	-- 						vim.lsp.diagnostic.on_publish_diagnostics, {
	-- 							virtual_text = false
	-- 						}
	-- 					),
	-- 				}
	-- 			}
	-- 		end

	-- 		vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
	-- 			if err ~= nil or result == nil then
	-- 				return
	-- 			end
	-- 			if not vim.api.nvim_buf_get_option(bufnr, "modified") then
	-- 				local view = vim.fn.winsaveview()
	-- 				vim.lsp.util.apply_text_edits(result, bufnr)
	-- 				vim.fn.winrestview(view)
	-- 				if bufnr == vim.api.nvim_get_current_buf() then
	-- 					vim.api.nvim_command("noautocmd :update")
	-- 				end
	-- 			end
	-- 		end

	-- 		local on_attach = function(client)
	-- 			if client.resolved_capabilities.document_formatting then
	-- 				vim.api.nvim_command [[augroup Format]]
	-- 				vim.api.nvim_command [[autocmd! * <buffer>]]
	-- 				vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
	-- 				vim.api.nvim_command [[augroup END]]
	-- 			end
	-- 		end

	-- 		-- Setup diagnostics formaters and linters for non LSP provided files
	-- 		nvim_lsp.efm.setup {
	-- 			on_attach = on_attach,
	-- 			capabilities = lsp_status.capabilities,
	-- 			init_options = {
	-- 				documentFormatting = true,
	-- 				codeAction = true
	-- 			},
	-- 			filetypes = {
	-- 				'javascript',
	-- 				"lua",
	-- 				"sh",
	-- 				"markdown",
	-- 				"json",
	-- 				"yaml",
	-- 				"toml",
	-- 				"python"

	-- 			}
	-- 		}
	-- 	end
	-- }
	--
	-- use {
	--   'glepnir/lspsaga.nvim',
	--   config = function()
	--   local saga = require 'lspsaga'
	--   saga.init_lsp_saga()
	--   end
	-- }

	-- color schemes
	-- use 'arcticicestudio/nord-vim'
	-- use 'NLKNguyen/papercolor-theme'
	-- use 'ajh17/spacegray.vim'
	-- use 'fxn/vim-monochrome'
	-- use 'cocopon/iceberg.vim'
	-- use 'drewtempelmeyer/palenight.vim'
	-- use 'Luxed/ayu-vim'
	-- use 'b4skyx/serenade'
	use { "catppuccin/nvim", as = "catppuccin" }
	-- use 'connorholyday/vim-snazzy'
	-- use 'navarasu/onedark.nvim'
	-- use 'morhetz/gruvbox'

	-- auto pairs
	--use 'alvan/vim-closetag'
	use 'AndrewRadev/tagalong.vim'
	-- use 'Raimondi/delimitMate'
	-- use 'cohama/lexima.vim'

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
			require("nvim-tree").setup({
				filters = {
					git_ignored = false,
				}
			})
		end
	}


	-- motions
	use 'unblevable/quick-scope'
	use 'tpope/vim-surround'
	use 'easymotion/vim-easymotion'

	-- eyecandy
	use 'sheerun/vim-polyglot'
	use 'nvim-tree/nvim-web-devicons'
	use 'norcalli/nvim-colorizer.lua'
	use {
		'akinsho/nvim-bufferline.lua',
		requires = 'nvim-tree/nvim-web-devicons',
		config = function()
			require 'bufferline'.setup {
			}
		end
	}
	use 'moll/vim-bbye'
	use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	use {
		'glepnir/galaxyline.nvim', branch = 'main', config = function() require 'faith.statusline-minimal' end,
		requires = { 'kyazdani42/nvim-web-devicons' }
	}

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	use {
		'camspiers/snap',
		config = function()
			local snap = require 'snap'
			snap.register.map({ "n" }, { "<C-p>" }, function()
				snap.run {
					producer = snap.get 'consumer.fzf' (snap.get 'producer.ripgrep.file'),
					select = snap.get 'select.file'.select,
					multiselect = snap.get 'select.file'.multiselect,
					views = { snap.get 'preview.file' }
				}
			end)
			snap.register.map({ "n" }, { "<Leader>p" }, function()
				snap.run {
					producer = snap.get 'producer.ripgrep.vimgrep',
					select = snap.get 'select.vimgrep'.select,
					multiselect = snap.get 'select.vimgrep'.multiselect,
					views = { snap.get 'preview.vimgrep' }
				}
			end)
		end
	}
end)
