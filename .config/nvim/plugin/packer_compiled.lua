-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/Luxed/ayu-vim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29faith.statusline-minimal\frequire\0" },
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/gina.vim",
    url = "https://github.com/lambdalisue/gina.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  kommentary = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nô\4\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\rfiletype\rNvimTree\15text_align\tleft\14highlight\14Directory\1\0\20\28show_buffer_close_icons\2\22show_buffer_icons\2\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\14indicator\b‚ñé\rmappings\2\fnumbers\tnone\fsort_by\14directory\27always_show_bufferline\2\25enforce_regular_tabs\2\20separator_style\tthin\24persist_buffer_sort\1\24show_tab_indicators\2\20show_close_icon\2\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["palenight.vim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/palenight.vim",
    url = "https://github.com/drewtempelmeyer/palenight.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  serenade = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/serenade",
    url = "https://github.com/b4skyx/serenade"
  },
  snap = {
    config = { "\27LJ\2\nÄ\2\0\0\b\1\v\1\"-\0\0\0009\0\0\0005\2\4\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2-\5\0\0009\5\1\5'\a\3\0B\5\2\0A\3\0\2=\3\5\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\a\3=\3\a\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\b\3=\3\b\0024\3\3\0-\4\0\0009\4\1\4'\6\t\0B\4\2\0?\4\0\0=\3\n\2B\0\2\1K\0\1\0\0¿\nviews\17preview.file\16multiselect\vselect\16select.file\rproducer\1\0\0\26producer.ripgrep.file\17consumer.fzf\bget\brun\3ÄÄ¿ô\4Ë\1\0\0\a\1\n\1\29-\0\0\0009\0\0\0005\2\3\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2=\3\4\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\6\3=\3\6\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\a\3=\3\a\0024\3\3\0-\4\0\0009\4\1\4'\6\b\0B\4\2\0?\4\0\0=\3\t\2B\0\2\1K\0\1\0\0¿\nviews\20preview.vimgrep\16multiselect\vselect\19select.vimgrep\rproducer\1\0\0\29producer.ripgrep.vimgrep\bget\brun\3ÄÄ¿ô\4ã\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0005\4\5\0003\5\6\0B\1\4\0019\1\2\0009\1\3\0015\3\a\0005\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\1\2\0\0\14<Leader>p\1\2\0\0\6n\0\1\2\0\0\n<C-p>\1\2\0\0\6n\bmap\rregister\tsnap\frequire\0" },
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/snap",
    url = "https://github.com/camspiers/snap"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-conflicted"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vim-conflicted",
    url = "https://github.com/christoomey/vim-conflicted"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-you-autocorrect"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vim-you-autocorrect",
    url = "https://github.com/sedm0784/vim-you-autocorrect"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/faith/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: snap
time([[Config for snap]], true)
try_loadstring("\27LJ\2\nÄ\2\0\0\b\1\v\1\"-\0\0\0009\0\0\0005\2\4\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2-\5\0\0009\5\1\5'\a\3\0B\5\2\0A\3\0\2=\3\5\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\a\3=\3\a\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\b\3=\3\b\0024\3\3\0-\4\0\0009\4\1\4'\6\t\0B\4\2\0?\4\0\0=\3\n\2B\0\2\1K\0\1\0\0¿\nviews\17preview.file\16multiselect\vselect\16select.file\rproducer\1\0\0\26producer.ripgrep.file\17consumer.fzf\bget\brun\3ÄÄ¿ô\4Ë\1\0\0\a\1\n\1\29-\0\0\0009\0\0\0005\2\3\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2=\3\4\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\6\3=\3\6\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\a\3=\3\a\0024\3\3\0-\4\0\0009\4\1\4'\6\b\0B\4\2\0?\4\0\0=\3\t\2B\0\2\1K\0\1\0\0¿\nviews\20preview.vimgrep\16multiselect\vselect\19select.vimgrep\rproducer\1\0\0\29producer.ripgrep.vimgrep\bget\brun\3ÄÄ¿ô\4ã\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0005\4\5\0003\5\6\0B\1\4\0019\1\2\0009\1\3\0015\3\a\0005\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\1\2\0\0\14<Leader>p\1\2\0\0\6n\0\1\2\0\0\n<C-p>\1\2\0\0\6n\bmap\rregister\tsnap\frequire\0", "config", "snap")
time([[Config for snap]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\nô\4\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0004\4\3\0005\5\4\0>\5\1\4=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\foffsets\1\0\3\rfiletype\rNvimTree\15text_align\tleft\14highlight\14Directory\1\0\20\28show_buffer_close_icons\2\22show_buffer_icons\2\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\14indicator\b‚ñé\rmappings\2\fnumbers\tnone\fsort_by\14directory\27always_show_bufferline\2\25enforce_regular_tabs\2\20separator_style\tthin\24persist_buffer_sort\1\24show_tab_indicators\2\20show_close_icon\2\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29faith.statusline-minimal\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'MarkdownPreview', function(cmdargs)
          require('packer.load')({'markdown-preview.nvim'}, { cmd = 'MarkdownPreview', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'markdown-preview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MarkdownPreview ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
