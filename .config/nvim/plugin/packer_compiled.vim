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
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
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
    config = { "\27LJ\2\n²\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\15highlights\1\0\0\14tab_close\1\0\2\nguifg\f#ff9940\nguibg\f#fafafa\tfill\1\0\0\1\0\2\nguifg\f#575f66\nguibg\f#fafafa\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n¯\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\6\tcalc\2\tpath\2\rnvim_lua\2\nvsnip\2\vbuffer\2\rnvim_lsp\2\1\0\f\19max_menu_width\3d\ndebug\1\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3\3\19source_timeout\3È\1\18throttle_time\3P\18documentation\2\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\næ\16\0\0\17\0K\0o6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0019\1\4\0009\1\5\0019\1\6\0015\2\n\0005\3\t\0=\3\v\2=\2\b\0016\1\f\0'\3\r\0B\1\2\0026\2\f\0'\4\14\0B\2\2\0025\3\15\0006\4\16\0\18\6\3\0B\4\2\4X\a\18€8\t\b\0029\t\17\t5\v\19\0009\f\18\1=\f\18\v5\f\24\0006\r\0\0009\r\1\r9\r\20\r6\15\0\0009\15\1\0159\15\21\0159\15\22\0155\16\23\0B\r\3\2=\r\25\f=\f\26\vB\t\2\1E\a\3\3R\aì9\4\27\0029\4\17\0045\6\28\0006\a\29\0=\a\29\0069\a\18\1=\a\18\0065\a\30\0=\a\31\0065\a \0=\a!\0065\a:\0005\b)\0005\t\"\0005\n#\0=\n$\t5\n%\0=\n&\t5\n'\0=\n(\t=\t*\b5\t+\0005\n,\0=\n$\t5\n-\0005\v.\0005\f/\0=\f0\v>\v\2\n=\n1\t=\t2\b5\t3\0005\n4\0=\n5\t5\n6\0=\n$\t5\n7\0=\n&\t5\n8\0=\n(\t=\t9\b=\b;\a5\b<\0=\b!\a5\b?\0005\t=\0005\n>\0=\n$\t=\t@\b5\tA\0005\nB\0=\n$\t=\tC\b5\tD\0005\nE\0=\n$\t=\tF\b=\bG\a5\bH\0=\bI\a=\aJ\6B\4\2\1K\0\1\0\17init_options\20formatFiletypes\1\0\a\tjson\rprettier\rmarkdown\rprettier\ash\nshfmt\blua\rprettier\vpython\nblack\ttoml\rprettier\tyaml\rprettier\15formatters\nblack\1\2\0\0\14%filepath\1\0\1\fcommand\nblack\rprettier\1\3\0\0\21--stdin-filepath\14%filepath\1\0\1\fcommand\rprettier\nshfmt\1\0\0\1\6\0\0\a-i\0062\b-bn\b-ci\b-sr\1\0\1\fcommand\nshfmt\1\0\4\bvue\veslint\rmarkdown\17markdownlint\ash\15shellcheck\15javascript\veslint\flinters\1\0\0\veslint\1\0\2\4\0€€€€\4\nerror\4\0€€Àÿ\3\fwarning\1\0\a\fendLine\fendLine\fmessage\27${message} [${ruleId}]\14endColumn\14endColumn\15errorsRoot\17[0].messages\vcolumn\vcolumn\tline\tline\rsecurity\rseverity\1\6\0\0\f--stdin\21--stdin-filename\14%filepath\r--format\tjson\17rootPatterns\1\3\0\0\17.eslintrc.js\17package.json\1\0\3\rdebounce\3d\fcommand\reslint_d\15sourceName\veslint\17markdownlint\18formatPattern\fmessage\1\2\0\0\3\4\1\0\2\vcolumn\3\3\tline\3\1\1\2\0\0>^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$\1\2\0\0\f--stdin\1\0\a\rdebounce\3d\fcommand\17markdownlint\risStderr\2\15sourceName\17markdownlint\16formatLines\3\1\17offsetColumn\3\0\15offsetLine\3\0\15shellcheck\1\0\0\15securities\1\0\4\nerror\nerror\tinfo\tinfo\fwarning\fwarning\nstyle\thint\14parseJson\1\0\6\fmessage\25${message} [${code}]\14endColumn\14endColumn\fendLine\fendLine\vcolumn\vcolumn\tline\tline\rsecurity\nlevel\targs\1\4\0\0\r--format\tjson\6-\1\0\3\rdebounce\3d\fcommand\15shellcheck\15sourceName\15shellcheck\14filetypes\1\b\0\0\blua\ash\rmarkdown\tjson\tyaml\ttoml\vpython\bcmd\1\3\0\0\30diagnostic-languageserver\f--stdio\14on_attach\1\0\0\17diagnosticls\rhandlers$textDocument/publishDiagnostics\1\0\0\1\0\1\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith\1\0\0\17capabilities\nsetup\vipairs\1\b\0\0\thtml\ncssls\vjsonls\nvuels\vbashls\rtsserver\fpyright\14lspconfig\15lsp-status\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0" },
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
  ["quick-scope"] = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  serenade = {
    loaded = true,
    path = "/home/faith/.local/share/nvim/site/pack/packer/start/serenade"
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
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29faith.statusline-minimal\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\n¯\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\6\tcalc\2\tpath\2\rnvim_lua\2\nvsnip\2\vbuffer\2\rnvim_lsp\2\1\0\f\19max_menu_width\3d\ndebug\1\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3\3\19source_timeout\3È\1\18throttle_time\3P\18documentation\2\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\næ\16\0\0\17\0K\0o6\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\0029\1\4\0009\1\5\0019\1\6\1+\2\2\0=\2\a\0019\1\4\0009\1\5\0019\1\6\0015\2\n\0005\3\t\0=\3\v\2=\2\b\0016\1\f\0'\3\r\0B\1\2\0026\2\f\0'\4\14\0B\2\2\0025\3\15\0006\4\16\0\18\6\3\0B\4\2\4X\a\18€8\t\b\0029\t\17\t5\v\19\0009\f\18\1=\f\18\v5\f\24\0006\r\0\0009\r\1\r9\r\20\r6\15\0\0009\15\1\0159\15\21\0159\15\22\0155\16\23\0B\r\3\2=\r\25\f=\f\26\vB\t\2\1E\a\3\3R\aì9\4\27\0029\4\17\0045\6\28\0006\a\29\0=\a\29\0069\a\18\1=\a\18\0065\a\30\0=\a\31\0065\a \0=\a!\0065\a:\0005\b)\0005\t\"\0005\n#\0=\n$\t5\n%\0=\n&\t5\n'\0=\n(\t=\t*\b5\t+\0005\n,\0=\n$\t5\n-\0005\v.\0005\f/\0=\f0\v>\v\2\n=\n1\t=\t2\b5\t3\0005\n4\0=\n5\t5\n6\0=\n$\t5\n7\0=\n&\t5\n8\0=\n(\t=\t9\b=\b;\a5\b<\0=\b!\a5\b?\0005\t=\0005\n>\0=\n$\t=\t@\b5\tA\0005\nB\0=\n$\t=\tC\b5\tD\0005\nE\0=\n$\t=\tF\b=\bG\a5\bH\0=\bI\a=\aJ\6B\4\2\1K\0\1\0\17init_options\20formatFiletypes\1\0\a\tjson\rprettier\rmarkdown\rprettier\ash\nshfmt\blua\rprettier\vpython\nblack\ttoml\rprettier\tyaml\rprettier\15formatters\nblack\1\2\0\0\14%filepath\1\0\1\fcommand\nblack\rprettier\1\3\0\0\21--stdin-filepath\14%filepath\1\0\1\fcommand\rprettier\nshfmt\1\0\0\1\6\0\0\a-i\0062\b-bn\b-ci\b-sr\1\0\1\fcommand\nshfmt\1\0\4\bvue\veslint\rmarkdown\17markdownlint\ash\15shellcheck\15javascript\veslint\flinters\1\0\0\veslint\1\0\2\4\0€€€€\4\nerror\4\0€€Àÿ\3\fwarning\1\0\a\fendLine\fendLine\fmessage\27${message} [${ruleId}]\14endColumn\14endColumn\15errorsRoot\17[0].messages\vcolumn\vcolumn\tline\tline\rsecurity\rseverity\1\6\0\0\f--stdin\21--stdin-filename\14%filepath\r--format\tjson\17rootPatterns\1\3\0\0\17.eslintrc.js\17package.json\1\0\3\rdebounce\3d\fcommand\reslint_d\15sourceName\veslint\17markdownlint\18formatPattern\fmessage\1\2\0\0\3\4\1\0\2\vcolumn\3\3\tline\3\1\1\2\0\0>^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$\1\2\0\0\f--stdin\1\0\a\rdebounce\3d\fcommand\17markdownlint\risStderr\2\15sourceName\17markdownlint\16formatLines\3\1\17offsetColumn\3\0\15offsetLine\3\0\15shellcheck\1\0\0\15securities\1\0\4\nerror\nerror\tinfo\tinfo\fwarning\fwarning\nstyle\thint\14parseJson\1\0\6\fmessage\25${message} [${code}]\14endColumn\14endColumn\fendLine\fendLine\vcolumn\vcolumn\tline\tline\rsecurity\nlevel\targs\1\4\0\0\r--format\tjson\6-\1\0\3\rdebounce\3d\fcommand\15shellcheck\15sourceName\15shellcheck\14filetypes\1\b\0\0\blua\ash\rmarkdown\tjson\tyaml\ttoml\vpython\bcmd\1\3\0\0\30diagnostic-languageserver\f--stdio\14on_attach\1\0\0\17diagnosticls\rhandlers$textDocument/publishDiagnostics\1\0\0\1\0\1\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith\1\0\0\17capabilities\nsetup\vipairs\1\b\0\0\thtml\ncssls\vjsonls\nvuels\vbashls\rtsserver\fpyright\14lspconfig\15lsp-status\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: nvim-bufferline.lua
time("Config for nvim-bufferline.lua", true)
try_loadstring("\27LJ\2\n²\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\15highlights\1\0\0\14tab_close\1\0\2\nguifg\f#ff9940\nguibg\f#fafafa\tfill\1\0\0\1\0\2\nguifg\f#575f66\nguibg\f#fafafa\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
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
