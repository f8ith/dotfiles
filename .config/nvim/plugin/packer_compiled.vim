" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/faith/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["ayu-vim"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/ayu-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29faith.statusline-minimal\frequire\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/gina.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  indentLine = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/indentLine"
  },
  kommentary = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "/home/faith/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nµ\b\0\0\r\0-\0H'\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0'\5\5\0'\6\6\0006\a\a\0'\t\b\0B\a\2\0029\a\t\a5\t\r\0005\n\n\0004\v\3\0005\f\v\0>\f\1\v=\v\f\n=\n\14\t5\n\17\0005\v\15\0=\0\16\v=\v\18\n5\v\19\0=\0\16\v=\v\20\n5\v\21\0=\3\22\v=\1\16\v=\v\23\n5\v\24\0=\2\22\v=\0\16\v=\v\25\n5\v\26\0=\2\22\v=\1\16\v=\v\27\n5\v\28\0=\1\22\v=\1\16\v=\v\29\n5\v\30\0=\4\22\v=\1\16\v=\v\31\n5\v \0=\3\22\v=\0\16\v=\v!\n5\v\"\0=\4\22\v=\1\16\v=\v#\n5\v$\0=\4\22\v=\1\16\v=\v%\n5\v&\0=\5\22\v=\1\16\v=\v'\n5\v(\0=\6\22\v=\0\16\v=\v)\n5\v*\0=\4\22\v=\0\16\v=\v+\n=\n,\tB\a\2\1K\0\1\0\15highlights\21modified_visible\1\0\0\rmodified\1\0\0\22modified_selected\1\0\0\14tab_close\1\0\0\17tab_selected\1\0\0\btab\1\0\0\23indicator_selected\1\0\0\22separator_visible\1\0\0\23separator_selected\1\0\0\14separator\1\0\0\20buffer_selected\nguifg\1\0\1\bgui\tbold\15background\1\0\0\tfill\1\0\0\nguibg\1\0\0\foptions\1\0\0\foffsets\1\0\3\rfiletype\rNvimTree\14highlight\14Directory\15text_align\tleft\1\0\20\24persist_buffer_sort\1\24show_tab_indicators\2\20show_close_icon\2\28show_buffer_close_icons\2\22show_buffer_icons\2\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\19indicator_icon\b‚ñé\rmappings\2\fnumbers\tnone\fsort_by\14directory\27always_show_bufferline\2\25enforce_regular_tabs\2\20separator_style\tthin\nsetup\15bufferline\frequire\f#ffc94a\f#ff3333\f#ff9940\f#5c6773\f#e1e1e2\f#e7e8e9\f#fafafa\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nØ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\6\vbuffer\2\rnvim_lsp\2\tcalc\2\tpath\2\rnvim_lua\2\nvsnip\2\1\0\f\19max_abbr_width\3d\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\ndebug\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nπ\2\0\5\n\0\r\0)\v\0\0\0X\5\2Ä\v\2\0\0X\5\1ÄK\0\1\0006\5\0\0009\5\1\0059\5\2\5\18\a\4\0'\b\3\0B\5\3\2\14\0\5\0X\5\27Ä6\5\0\0009\5\4\0059\5\5\5B\5\1\0026\6\0\0009\6\6\0069\6\a\0069\6\b\6\18\b\2\0\18\t\4\0B\6\3\0016\6\0\0009\6\4\0069\6\t\6\18\b\5\0B\6\2\0016\6\0\0009\6\1\0069\6\n\6B\6\1\2\5\4\6\0X\6\5Ä6\6\0\0009\6\1\0069\6\v\6'\b\f\0B\6\2\1K\0\1\0\22noautocmd :update\17nvim_command\25nvim_get_current_buf\16winrestview\21apply_text_edits\tutil\blsp\16winsaveview\afn\rmodified\24nvim_buf_get_option\bapi\bvimî\2\0\1\4\0\t\0\0259\1\0\0009\1\1\1\15\0\1\0X\2\20Ä6\1\2\0009\1\3\0019\1\4\1'\3\5\0B\1\2\0016\1\2\0009\1\3\0019\1\4\1'\3\6\0B\1\2\0016\1\2\0009\1\3\0019\1\4\1'\3\a\0B\1\2\0016\1\2\0009\1\3\0019\1\4\1'\3\b\0B\1\2\1K\0\1\0\16augroup END?autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()\24autocmd! * <buffer>\19augroup Format\17nvim_command\bapi\bvim\24document_formatting\26resolved_capabilities´\6\1\0\17\0%\0B6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0019\1\4\0009\1\5\0019\1\6\0015\2\n\0005\3\t\0=\3\v\2=\2\b\0016\1\f\0'\3\r\0B\1\2\0026\2\f\0'\4\14\0B\2\2\0025\3\15\0006\4\16\0\18\6\3\0B\4\2\4X\a\18Ä8\t\b\0029\t\17\t5\v\19\0009\f\18\1=\f\18\v5\f\24\0006\r\0\0009\r\1\r9\r\20\r6\15\0\0009\15\1\0159\15\21\0159\15\22\0155\16\23\0B\r\3\2=\r\25\f=\f\26\vB\t\2\1E\a\3\3R\aÏ6\4\0\0009\4\1\0049\4\26\0043\5\28\0=\5\27\0043\4\29\0009\5\30\0029\5\17\0055\a\31\0=\4 \a9\b\18\1=\b\18\a5\b!\0=\b\"\a5\b#\0=\b$\aB\5\2\1K\0\1\0\14filetypes\1\t\0\0\15javascript\blua\ash\rmarkdown\tjson\tyaml\ttoml\vpython\17init_options\1\0\2\15codeAction\2\23documentFormatting\2\14on_attach\1\0\0\befm\0\0\28textDocument/formatting\rhandlers$textDocument/publishDiagnostics\1\0\0\1\0\1\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith\1\0\0\17capabilities\nsetup\vipairs\1\t\0\0\thtml\ncssls\vjsonls\nvuels\vbashls\rtsserver\fpyright\ngopls\14lspconfig\15lsp-status\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  serenade = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/serenade"
  },
  snap = {
    config = { "\27LJ\2\nÄ\2\0\0\b\1\v\1\"-\0\0\0009\0\0\0005\2\4\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2-\5\0\0009\5\1\5'\a\3\0B\5\2\0A\3\0\2=\3\5\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\a\3=\3\a\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\b\3=\3\b\0024\3\3\0-\4\0\0009\4\1\4'\6\t\0B\4\2\0?\4\0\0=\3\n\2B\0\2\1K\0\1\0\0¿\nviews\17preview.file\16multiselect\vselect\16select.file\rproducer\1\0\0\26producer.ripgrep.file\17consumer.fzf\bget\brun\3ÄÄ¿ô\4Ë\1\0\0\a\1\n\1\29-\0\0\0009\0\0\0005\2\3\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2=\3\4\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\6\3=\3\6\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\a\3=\3\a\0024\3\3\0-\4\0\0009\4\1\4'\6\b\0B\4\2\0?\4\0\0=\3\t\2B\0\2\1K\0\1\0\0¿\nviews\20preview.vimgrep\16multiselect\vselect\19select.vimgrep\rproducer\1\0\0\29producer.ripgrep.vimgrep\bget\brun\3ÄÄ¿ô\4ã\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0005\4\5\0003\5\6\0B\1\4\0019\1\2\0009\1\3\0015\3\a\0005\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\1\2\0\0\14<Leader>p\1\2\0\0\6n\0\1\2\0\0\n<C-p>\1\2\0\0\6n\bmap\rregister\tsnap\frequire\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/snap"
  },
  undotree = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-bbye"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-conflicted"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-conflicted"
  },
  ["vim-cutlass"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-cutlass"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-you-autocorrect"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vim-you-autocorrect"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/vista.vim"
  }
}

time("Defining packer_plugins", false)
-- Config for: lspsaga.nvim
time("Config for lspsaga.nvim", true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time("Config for lspsaga.nvim", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29faith.statusline-minimal\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: snap
time("Config for snap", true)
try_loadstring("\27LJ\2\nÄ\2\0\0\b\1\v\1\"-\0\0\0009\0\0\0005\2\4\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2-\5\0\0009\5\1\5'\a\3\0B\5\2\0A\3\0\2=\3\5\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\a\3=\3\a\2-\3\0\0009\3\1\3'\5\6\0B\3\2\0029\3\b\3=\3\b\0024\3\3\0-\4\0\0009\4\1\4'\6\t\0B\4\2\0?\4\0\0=\3\n\2B\0\2\1K\0\1\0\0¿\nviews\17preview.file\16multiselect\vselect\16select.file\rproducer\1\0\0\26producer.ripgrep.file\17consumer.fzf\bget\brun\3ÄÄ¿ô\4Ë\1\0\0\a\1\n\1\29-\0\0\0009\0\0\0005\2\3\0-\3\0\0009\3\1\3'\5\2\0B\3\2\2=\3\4\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\6\3=\3\6\2-\3\0\0009\3\1\3'\5\5\0B\3\2\0029\3\a\3=\3\a\0024\3\3\0-\4\0\0009\4\1\4'\6\b\0B\4\2\0?\4\0\0=\3\t\2B\0\2\1K\0\1\0\0¿\nviews\20preview.vimgrep\16multiselect\vselect\19select.vimgrep\rproducer\1\0\0\29producer.ripgrep.vimgrep\bget\brun\3ÄÄ¿ô\4ã\1\1\0\6\0\n\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0015\3\4\0005\4\5\0003\5\6\0B\1\4\0019\1\2\0009\1\3\0015\3\a\0005\4\b\0003\5\t\0B\1\4\0012\0\0ÄK\0\1\0\0\1\2\0\0\14<Leader>p\1\2\0\0\6n\0\1\2\0\0\n<C-p>\1\2\0\0\6n\bmap\rregister\tsnap\frequire\0", "config", "snap")
time("Config for snap", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\nØ\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\6\vbuffer\2\rnvim_lsp\2\tcalc\2\tpath\2\rnvim_lua\2\nvsnip\2\1\0\f\19max_abbr_width\3d\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\ndebug\1\21incomplete_delay\3ê\3\19source_timeout\3»\1\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\nπ\2\0\5\n\0\r\0)\v\0\0\0X\5\2Ä\v\2\0\0X\5\1ÄK\0\1\0006\5\0\0009\5\1\0059\5\2\5\18\a\4\0'\b\3\0B\5\3\2\14\0\5\0X\5\27Ä6\5\0\0009\5\4\0059\5\5\5B\5\1\0026\6\0\0009\6\6\0069\6\a\0069\6\b\6\18\b\2\0\18\t\4\0B\6\3\0016\6\0\0009\6\4\0069\6\t\6\18\b\5\0B\6\2\0016\6\0\0009\6\1\0069\6\n\6B\6\1\2\5\4\6\0X\6\5Ä6\6\0\0009\6\1\0069\6\v\6'\b\f\0B\6\2\1K\0\1\0\22noautocmd :update\17nvim_command\25nvim_get_current_buf\16winrestview\21apply_text_edits\tutil\blsp\16winsaveview\afn\rmodified\24nvim_buf_get_option\bapi\bvimî\2\0\1\4\0\t\0\0259\1\0\0009\1\1\1\15\0\1\0X\2\20Ä6\1\2\0009\1\3\0019\1\4\1'\3\5\0B\1\2\0016\1\2\0009\1\3\0019\1\4\1'\3\6\0B\1\2\0016\1\2\0009\1\3\0019\1\4\1'\3\a\0B\1\2\0016\1\2\0009\1\3\0019\1\4\1'\3\b\0B\1\2\1K\0\1\0\16augroup END?autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()\24autocmd! * <buffer>\19augroup Format\17nvim_command\bapi\bvim\24document_formatting\26resolved_capabilities´\6\1\0\17\0%\0B6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0019\1\4\0009\1\5\0019\1\6\0015\2\n\0005\3\t\0=\3\v\2=\2\b\0016\1\f\0'\3\r\0B\1\2\0026\2\f\0'\4\14\0B\2\2\0025\3\15\0006\4\16\0\18\6\3\0B\4\2\4X\a\18Ä8\t\b\0029\t\17\t5\v\19\0009\f\18\1=\f\18\v5\f\24\0006\r\0\0009\r\1\r9\r\20\r6\15\0\0009\15\1\0159\15\21\0159\15\22\0155\16\23\0B\r\3\2=\r\25\f=\f\26\vB\t\2\1E\a\3\3R\aÏ6\4\0\0009\4\1\0049\4\26\0043\5\28\0=\5\27\0043\4\29\0009\5\30\0029\5\17\0055\a\31\0=\4 \a9\b\18\1=\b\18\a5\b!\0=\b\"\a5\b#\0=\b$\aB\5\2\1K\0\1\0\14filetypes\1\t\0\0\15javascript\blua\ash\rmarkdown\tjson\tyaml\ttoml\vpython\17init_options\1\0\2\15codeAction\2\23documentFormatting\2\14on_attach\1\0\0\befm\0\0\28textDocument/formatting\rhandlers$textDocument/publishDiagnostics\1\0\0\1\0\1\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith\1\0\0\17capabilities\nsetup\vipairs\1\t\0\0\thtml\ncssls\vjsonls\nvuels\vbashls\rtsserver\fpyright\ngopls\14lspconfig\15lsp-status\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: nvim-bufferline.lua
time("Config for nvim-bufferline.lua", true)
try_loadstring("\27LJ\2\nµ\b\0\0\r\0-\0H'\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0'\5\5\0'\6\6\0006\a\a\0'\t\b\0B\a\2\0029\a\t\a5\t\r\0005\n\n\0004\v\3\0005\f\v\0>\f\1\v=\v\f\n=\n\14\t5\n\17\0005\v\15\0=\0\16\v=\v\18\n5\v\19\0=\0\16\v=\v\20\n5\v\21\0=\3\22\v=\1\16\v=\v\23\n5\v\24\0=\2\22\v=\0\16\v=\v\25\n5\v\26\0=\2\22\v=\1\16\v=\v\27\n5\v\28\0=\1\22\v=\1\16\v=\v\29\n5\v\30\0=\4\22\v=\1\16\v=\v\31\n5\v \0=\3\22\v=\0\16\v=\v!\n5\v\"\0=\4\22\v=\1\16\v=\v#\n5\v$\0=\4\22\v=\1\16\v=\v%\n5\v&\0=\5\22\v=\1\16\v=\v'\n5\v(\0=\6\22\v=\0\16\v=\v)\n5\v*\0=\4\22\v=\0\16\v=\v+\n=\n,\tB\a\2\1K\0\1\0\15highlights\21modified_visible\1\0\0\rmodified\1\0\0\22modified_selected\1\0\0\14tab_close\1\0\0\17tab_selected\1\0\0\btab\1\0\0\23indicator_selected\1\0\0\22separator_visible\1\0\0\23separator_selected\1\0\0\14separator\1\0\0\20buffer_selected\nguifg\1\0\1\bgui\tbold\15background\1\0\0\tfill\1\0\0\nguibg\1\0\0\foptions\1\0\0\foffsets\1\0\3\rfiletype\rNvimTree\14highlight\14Directory\15text_align\tleft\1\0\20\24persist_buffer_sort\1\24show_tab_indicators\2\20show_close_icon\2\28show_buffer_close_icons\2\22show_buffer_icons\2\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\19indicator_icon\b‚ñé\rmappings\2\fnumbers\tnone\fsort_by\14directory\27always_show_bufferline\2\25enforce_regular_tabs\2\20separator_style\tthin\nsetup\15bufferline\frequire\f#ffc94a\f#ff3333\f#ff9940\f#5c6773\f#e1e1e2\f#e7e8e9\f#fafafa\0", "config", "nvim-bufferline.lua")
time("Config for nvim-bufferline.lua", false)

-- Command lazy-loads
time("Defining lazy-load commands", true)
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time("Defining lazy-load commands", false)

if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
