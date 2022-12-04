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
local package_path_str = "/Users/emma/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/emma/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/emma/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/emma/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/emma/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["ayu-vim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/Luxed/ayu-vim"
  },
  catppuccin = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29faith.statusline-minimal\frequire\0" },
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/glepnir/galaxyline.nvim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/gina.vim",
    url = "https://github.com/lambdalisue/gina.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  indentLine = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  kommentary = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nΩ\b\0\0\r\0-\0H'\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0'\5\5\0'\6\6\0006\a\a\0'\t\b\0B\a\2\0029\a\t\a5\t\r\0005\n\n\0004\v\3\0005\f\v\0>\f\1\v=\v\f\n=\n\14\t5\n\17\0005\v\15\0=\0\16\v=\v\18\n5\v\19\0=\0\16\v=\v\20\n5\v\21\0=\3\22\v=\1\16\v=\v\23\n5\v\24\0=\2\22\v=\0\16\v=\v\25\n5\v\26\0=\2\22\v=\1\16\v=\v\27\n5\v\28\0=\1\22\v=\1\16\v=\v\29\n5\v\30\0=\4\22\v=\1\16\v=\v\31\n5\v \0=\3\22\v=\0\16\v=\v!\n5\v\"\0=\4\22\v=\1\16\v=\v#\n5\v$\0=\4\22\v=\1\16\v=\v%\n5\v&\0=\5\22\v=\1\16\v=\v'\n5\v(\0=\6\22\v=\0\16\v=\v)\n5\v*\0=\4\22\v=\0\16\v=\v+\n=\n,\tB\a\2\1K\0\1\0\15highlights\21modified_visible\1\0\0\rmodified\1\0\0\22modified_selected\1\0\0\14tab_close\1\0\0\17tab_selected\1\0\0\btab\1\0\0\23indicator_selected\1\0\0\22separator_visible\1\0\0\23separator_selected\1\0\0\14separator\1\0\0\20buffer_selected\afg\1\0\3\14undercurl\1\tbold\2\14underline\2\15background\1\0\0\tfill\1\0\0\abg\1\0\0\foptions\1\0\0\foffsets\1\0\3\14highlight\14Directory\15text_align\tleft\rfiletype\rNvimTree\1\0\20\15close_icon\bÔÄç\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\14indicator\b‚ñé\rmappings\2\fnumbers\tnone\fsort_by\14directory\27always_show_bufferline\2\25enforce_regular_tabs\2\20separator_style\tthin\24persist_buffer_sort\1\24show_tab_indicators\2\20show_close_icon\2\28show_buffer_close_icons\2\22show_buffer_icons\2\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\nsetup\15bufferline\frequire\f#fabd2f\f#ec5f67\f#FF8800\f#abb2bf\f#3e4452\f#282c34\f#21252b\0" },
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nØ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\6\tcalc\2\tpath\2\nvsnip\2\vbuffer\2\rnvim_lua\2\rnvim_lsp\2\1\0\f\18throttle_time\3P\18documentation\2\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\ndebug\1\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3»\1\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/nvim-compe",
    url = "https://github.com/hrsh7th/nvim-compe"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["palenight.vim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/palenight.vim",
    url = "https://github.com/drewtempelmeyer/palenight.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  serenade = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/serenade",
    url = "https://github.com/b4skyx/serenade"
  },
  snap = {
    config = { "\27LJ\2\nÄ\2\0\0\b\1\v\1\"-\0\0\0009\0\0\0005\2\4\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2-\5\0\0009\5\1\5'\a\3\0B\5\2\0A\3\0\2=\3\5\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\a\3=\3\a\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\b\3=\3\b\0024\3\3\0-\4\0\0009\4\1\4'\6\t\0B\4\2\0?\4\0\0=\3\n\2B\0\2\1K\0\1\0\0¿\nviews\17preview.file\16multiselect\vselect\16select.file\rproducer\1\0\0\26producer.ripgrep.file\17consumer.fzf\bget\brun\3ÄÄ¿ô\4Ë\1\0\0\a\1\n\1\29-\0\0\0009\0\0\0005\2\3\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2=\3\4\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\6\3=\3\6\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\a\3=\3\a\0024\3\3\0-\4\0\0009\4\1\4'\6\b\0B\4\2\0?\4\0\0=\3\t\2B\0\2\1K\0\1\0\0¿\nviews\20preview.vimgrep\16multiselect\vselect\19select.vimgrep\rproducer\1\0\0\29producer.ripgrep.vimgrep\bget\brun\3ÄÄ¿ô\4ã\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0005\4\5\0003\5\6\0B\1\4\0019\1\2\0009\1\3\0015\3\a\0005\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\1\2\0\0\14<Leader>p\1\2\0\0\6n\0\1\2\0\0\n<C-p>\1\2\0\0\6n\bmap\rregister\tsnap\frequire\0" },
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/snap",
    url = "https://github.com/camspiers/snap"
  },
  undotree = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-conflicted"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-conflicted",
    url = "https://github.com/christoomey/vim-conflicted"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-you-autocorrect"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vim-you-autocorrect",
    url = "https://github.com/sedm0784/vim-you-autocorrect"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/Users/emma/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29faith.statusline-minimal\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\nΩ\b\0\0\r\0-\0H'\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0'\5\5\0'\6\6\0006\a\a\0'\t\b\0B\a\2\0029\a\t\a5\t\r\0005\n\n\0004\v\3\0005\f\v\0>\f\1\v=\v\f\n=\n\14\t5\n\17\0005\v\15\0=\0\16\v=\v\18\n5\v\19\0=\0\16\v=\v\20\n5\v\21\0=\3\22\v=\1\16\v=\v\23\n5\v\24\0=\2\22\v=\0\16\v=\v\25\n5\v\26\0=\2\22\v=\1\16\v=\v\27\n5\v\28\0=\1\22\v=\1\16\v=\v\29\n5\v\30\0=\4\22\v=\1\16\v=\v\31\n5\v \0=\3\22\v=\0\16\v=\v!\n5\v\"\0=\4\22\v=\1\16\v=\v#\n5\v$\0=\4\22\v=\1\16\v=\v%\n5\v&\0=\5\22\v=\1\16\v=\v'\n5\v(\0=\6\22\v=\0\16\v=\v)\n5\v*\0=\4\22\v=\0\16\v=\v+\n=\n,\tB\a\2\1K\0\1\0\15highlights\21modified_visible\1\0\0\rmodified\1\0\0\22modified_selected\1\0\0\14tab_close\1\0\0\17tab_selected\1\0\0\btab\1\0\0\23indicator_selected\1\0\0\22separator_visible\1\0\0\23separator_selected\1\0\0\14separator\1\0\0\20buffer_selected\afg\1\0\3\14undercurl\1\tbold\2\14underline\2\15background\1\0\0\tfill\1\0\0\abg\1\0\0\foptions\1\0\0\foffsets\1\0\3\14highlight\14Directory\15text_align\tleft\rfiletype\rNvimTree\1\0\20\15close_icon\bÔÄç\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\14indicator\b‚ñé\rmappings\2\fnumbers\tnone\fsort_by\14directory\27always_show_bufferline\2\25enforce_regular_tabs\2\20separator_style\tthin\24persist_buffer_sort\1\24show_tab_indicators\2\20show_close_icon\2\28show_buffer_close_icons\2\22show_buffer_icons\2\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\nsetup\15bufferline\frequire\f#fabd2f\f#ec5f67\f#FF8800\f#abb2bf\f#3e4452\f#282c34\f#21252b\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: snap
time([[Config for snap]], true)
try_loadstring("\27LJ\2\nÄ\2\0\0\b\1\v\1\"-\0\0\0009\0\0\0005\2\4\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2-\5\0\0009\5\1\5'\a\3\0B\5\2\0A\3\0\2=\3\5\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\a\3=\3\a\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\b\3=\3\b\0024\3\3\0-\4\0\0009\4\1\4'\6\t\0B\4\2\0?\4\0\0=\3\n\2B\0\2\1K\0\1\0\0¿\nviews\17preview.file\16multiselect\vselect\16select.file\rproducer\1\0\0\26producer.ripgrep.file\17consumer.fzf\bget\brun\3ÄÄ¿ô\4Ë\1\0\0\a\1\n\1\29-\0\0\0009\0\0\0005\2\3\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2=\3\4\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\6\3=\3\6\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\a\3=\3\a\0024\3\3\0-\4\0\0009\4\1\4'\6\b\0B\4\2\0?\4\0\0=\3\t\2B\0\2\1K\0\1\0\0¿\nviews\20preview.vimgrep\16multiselect\vselect\19select.vimgrep\rproducer\1\0\0\29producer.ripgrep.vimgrep\bget\brun\3ÄÄ¿ô\4ã\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0005\4\5\0003\5\6\0B\1\4\0019\1\2\0009\1\3\0015\3\a\0005\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\1\2\0\0\14<Leader>p\1\2\0\0\6n\0\1\2\0\0\n<C-p>\1\2\0\0\6n\bmap\rregister\tsnap\frequire\0", "config", "snap")
time([[Config for snap]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\nØ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\6\tcalc\2\tpath\2\nvsnip\2\vbuffer\2\rnvim_lua\2\rnvim_lsp\2\1\0\f\18throttle_time\3P\18documentation\2\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\ndebug\1\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3»\1\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
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
