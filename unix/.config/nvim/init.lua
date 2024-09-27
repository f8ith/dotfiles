require("faith.settings")
require("faith.remap")

if vim.g.vscode then
	require("code.remap")
	return
end

vim.opt.signcolumn = "yes"
require("faith.lazy")
-- vim.o.statusline = [[%!v:lua.require'faith.statusline'.get()]]
-- vim.o.statusline = [[%<%f %h%m%r %y%=%{v:register} %-14.(%l,%c%V%) %P]]
