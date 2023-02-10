vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200}) 
    autocmd BufWinEnter * set formatoptions-=cro
  augroup end

  " augroup _auto_format
  "   autocmd!
  "   autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync({}, 4000)
  " augroup end
]]
