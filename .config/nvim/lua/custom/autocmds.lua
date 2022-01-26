vim.cmd([[
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
au BufEnter * NeoRoot
]])
