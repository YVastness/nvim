" ==
" == coc.nvim
" ==
let g:coc_global_extensions = ['coc-go','coc-pairs','coc-explorer','coc-lightbulb','coc-git','coc-translator','coc-json','coc-clangd','coc-python','coc-vimlsp','coc-snippets','coc-sh','coc-marketplace','coc-flutter-tools']

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
"使用Tab进行选择补全
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 使用`[g` 和 `]g`去导航诊断
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code 导航.
" 列出定义列表
nmap <silent> gd <Plug>(coc-definition)
" 转至类型定义
nmap <silent> gy <Plug>(coc-type-definition)
" 待办事项清单
nmap <silent> go <Plug>(coc-implementation)
" 列出参考列表
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
" 按住光标时突出显示符号及其引用。
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" 将codeAction应用到所选区域。
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ===
" ===
"coc-translator
" ===
" ===
" 弹出翻译窗口
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)
" replace
nmap <Leader>r <Plug>(coc-translator-r)
vmap <Leader>r <Plug>(coc-translator-rv)
" ===
" ===
" coc-git
" ===
" ===
noremap <leader>gf :CocCommand git.foldUnchanged<CR>
" navigate chunks of current buffer
nmap <Leader>- <Plug>(coc-git-prevchunk)
nmap <Leader>= <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <leader>gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
nmap tt :CocCommand explorer<CR>
" ompile function
noremap <leader>rr :call CompileRunGcc()<CR>
function! CompileRunGcc()
  execute "w"
  if &filetype == 'c'
    if !isdirectory('build')
      execute "!mkdir build"
    endif
    execute "!gcc % -o build/%<"
    execute "!time ./build/%<"
  endif
endfunction
