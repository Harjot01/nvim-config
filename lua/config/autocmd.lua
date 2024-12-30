vim.cmd([[
  augroup lsp_formatting
    autocmd!
    autocmd BufWritePre *.lua,*.ts,*.cpp,*.py,*.jsx,*.tsx lua vim.lsp.buf.format()
  augroup END
]])
