require("faith.settings")
require("faith.remap")

if vim.g.vscode then
	require("code")
	return
end

vim.opt.signcolumn = "yes"
require("faith.lazy")
