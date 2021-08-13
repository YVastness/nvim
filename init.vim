" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|



" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 定义快捷键的前缀，即<Leader>
let mapleader=" "

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
"set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 禁止折行
set nowrap
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
inoremap jj <ESC>
" 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf配置
" The straightforward way to use fzf.vim is appending this line to your vimrc
"source /usr/share/doc/fzf/examples/fzf.vim
" find file
noremap \ :FZF<CR>
" find history
noremap <C-h> :MRU<CR>
" find lines containing keywords
noremap <C-l> :LinesWithPreview<CR>
" find buffer
noremap <C-b> :Buffers<CR>
noremap <C-t> :BTags<CR>
noremap <leader>h :History:<CR>
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler

command! -bang -nargs=* Buffers
  \ call fzf#vim#buffers(
  \   '',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:0%', '?'),
  \   <bang>0)

command! -bang -nargs=* LinesWithPreview
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --color=always --smart-case . '.fnameescape(expand('%')), 1,
    \   fzf#vim#with_preview({'options': '--delimiter : --nth 4.. --sort'}, 'up:50%', '?'),
    \   1)

command! -bang -nargs=* MRU call fzf#vim#history(fzf#vim#with_preview())


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'codota/tabnine-vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'overcache/NeoSolarized'
Plug 'jacoborus/tender.vim'
" colorscheme tender
Plug 'rakr/vim-one'
" colorscheme one
Plug 'drewtempelmeyer/palenight.vim'
" colorscheme palenight
Plug 'KeitaNakamura/neodark.vim'
" colorscheme neodark
Plug 'crusoexia/vim-monokai'
" colorscheme monokai
Plug 'morhetz/gruvbox'
" colorscheme gruvbox

"Plug 'Lokaltog/vim-powerline'
Plug 'glepnir/spaceline.vim'
" Use the icon plugin for better behavior
Plug 'ryanoasis/vim-devicons'

" 插件列表结束
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 支持真彩色
set termguicolors
" 配色方案
set background=dark
"colorscheme tender
"colorscheme one
"colorscheme palenight
"colorscheme neodark
"colorscheme monokai
"colorscheme gruvbox
colorscheme NeoSolarized
"colorscheme solarized

" 设置状态栏主题风格
"let g:Powerline_colorscheme='solarized256'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"coc.nvim
"let g:coc_global_extensions = ['coc-json','coc-clangd','coc-python']
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"使用Tab进行选择补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
