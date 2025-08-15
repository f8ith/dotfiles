return {
	-- misc
	"b3nj5m1n/kommentary",

	-- color schemes
	--  'arcticicestudio/nord-vim'
	--  'NLKNguyen/papercolor-theme'
	--  'ajh17/spacegray.vim'
	--  'fxn/vim-monochrome'
	--  'cocopon/iceberg.vim'
	--  'drewtempelmeyer/palenight.vim'
	--  'Luxed/ayu-vim'
	--  'b4skyx/serenade'
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			highlight_overrides = {
	-- 				all = function(colors)
	-- 					return {
	-- 						CursorLineNr = { fg = colors.peach },
	-- 					}
	-- 				end,
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },
	--  'connorholyday/vim-snazzy'
	--  'navarasu/onedark.nvim'
	--  'morhetz/gruvbox'
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- auto pairs
	"AndrewRadev/tagalong.vim",
	--  'Raimondi/delimitMate',
	--  'cohama/lexima.vim',

	-- git
	"tpope/vim-fugitive",
	"christoomey/vim-conflicted",
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	-- tools
	"sedm0784/vim-you-autocorrect",
	"tpope/vim-unimpaired",
	"mattn/emmet-vim",
	"liuchengxu/vista.vim",

	-- file manager
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
			vim.keymap.set("n", "<leader>r", "<cmd>NvimTreeRefresh<CR>")
			vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>")
			require("nvim-tree").setup({
				filters = {
					git_ignored = false,
				},
				view = {
					side = "right",
				},
			})
		end,
	},

	-- motions
	"unblevable/quick-scope",
	"tpope/vim-surround",
	"easymotion/vim-easymotion",

	-- eyecandy
	-- "sheerun/vim-polyglot",
	"nvim-tree/nvim-web-devicons",
	"norcalli/nvim-colorizer.lua",
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				highlight = {
					-- `false` will disable the whole extension
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},

				indent = { enable = true },
			})
		end,
	},

	"moll/vim-bbye",
	{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" },

	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.keymap.set("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>", { silent = true })
			vim.keymap.set("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
			vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<CR>", { silent = true })
			vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
			vim.keymap.set("n", "<leader>x", "<cmd>Bdelete<CR>", { silent = true })

			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "NvimTree",
							text = "",
							highlight = "Fill",
							separator = false, -- use a "true" to enable the default, or set your own character
						},
					},
				},
				highlights = require("rose-pine.plugins.bufferline"),
			})
		end,
	},

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup({})
		end,
	},
}
