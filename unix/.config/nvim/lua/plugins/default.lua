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
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	--  'connorholyday/vim-snazzy'
	--  'navarasu/onedark.nvim'
	--  'morhetz/gruvbox'

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
			require("nvim-tree").setup({
				filters = {
					git_ignored = false,
				},
			})
		end,
	},

	-- motions
  "unblevable/quick-scope",
	"tpope/vim-surround",
	"easymotion/vim-easymotion",

	-- eyecandy
	"sheerun/vim-polyglot",
	"nvim-tree/nvim-web-devicons",
	"norcalli/nvim-colorizer.lua",

	{
		"akinsho/nvim-bufferline.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},

	"moll/vim-bbye",
	{ "iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview" },
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

	{
		"glepnir/galaxyline.nvim",
		branch = "main",
		config = function()
			require("faith.statusline-minimal")
		end,
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
}
