vim.cmd [[autocmd CursorHold * :lua require'lspsaga.diagnostic'.show_cursor_diagnostics()]]
vim.cmd [[autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif]]
