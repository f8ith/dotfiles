require("faith.settings")

if vim.g.vscode == true then
	require("faith.remap")
	return
end

vim.opt.signcolumn = "yes"
require("faith.remap")
require("faith.lazy")
require("faith.treesitter")
