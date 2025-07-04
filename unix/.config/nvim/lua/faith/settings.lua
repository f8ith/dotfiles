vim.opt.foldmethod = "marker"
vim.opt.showmode = false
vim.opt.timeoutlen = 200
vim.opt.ttimeoutlen = 200
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.completeopt = {
	menuone = true,
	noselect = true,
}
vim.opt.lazyredraw = true
vim.opt.icm = "nosplit"
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.inccommand = "split"
vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

vim.filetype.add({
	extension = {
		tpp = "cpp",
	},
})
