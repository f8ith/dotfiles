require("faith.settings")
require("faith.remap")
require("faith.lazy")

if vim.g.vscode then
  require("code")
  return
end

vim.opt.signcolumn = "yes"
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true, notify = false },
})
